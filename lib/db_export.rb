require 'mysql2'

module AiB
  class DBExport
    attr_reader :collaborations, :projects, :participants
  
    def initialize options = {}
      params = { 
        host: "localhost",
        db: "aib_intranet",
        port: 3306
      }.merge(options)

      @mysql = Mysql2::Client.new(host: params[:host], username: params[:user], password: params[:password], database: params[:db], port: params[:port])
      @projects = { ca: [], es: [], en: [] }
      @participants = []
      @collaborations = []
    end

    def fill_data
      extract_projects
      extract_participants
      self
    end

    private

    def extract_participants
      extract_clients
      extract_colabs
      clean_up_participants
    end

    def extract_clients
      results = query "select distinct pclientca from projectes"
      results.each do |row|
        @participants << row['pclientca'].split("&&&").map!(&:strip)
      end
    end
    
    def extract_colabs
      results = query "SELECT distinct pColabsCa FROM projectes"
      results.each do |row|
        @participants << row['pColabsCa'].split("&&&").map!(&:strip)
      end
    end

    def extract_projects
      results = query "SELECT * FROM projectes"

      results.each do |row|
        ca = {
          code: format(row["pID"]),
          name: format(row["pNameCa"]),
          description: format(row["pDescriptionCa"]),
          status: status(row["pStatus"]),
          commission: commission(row["pCatAmbit"]),
          address: format(row["pLocation"]),
          city: format(row["pCity"]),
          state: format(row["pState"]),
          country: format(row["pCountry"]),
          start_year: format(row["pDateStart"]),
          end_year: format(row["pDateEnd"]),
          gfa: format(row["pSupCons"]),
          exterior_area: format(row["pSupUrb"]),
          budget: format(row["pCost"]),
          published: published(row["pVisInter"])
        }
        es = {
          code: format(row["pID"]),
          name: format(row["pNameEs"]),
          description: format(row["pDescriptionEs"]),
        }
        en = {
          code: format(row["pID"]),
          name: format(row["pNameEn"]),
          description: format(row["pDescriptionEn"]),
        }
        colabs_collaborations_for row['pID']
        client_collaborations_for row['pID']
        @projects[:ca] << ca
        @projects[:es] << es
        @projects[:en] << en
      end
      @projects
    end

    private

    def query query
      @mysql.query(query)
    end

    def clean_up_participants
      @participants.flatten!.uniq!.sort
    end

    def colabs_collaborations_for project_id
      results = query "SELECT distinct pColabsCa FROM projectes where pID='#{project_id}'"
      results.each do |row|
        row['pColabsCa'].split("&&&").map!(&:strip).each do |coauthor|
          @collaborations << {id: project_id, role: :coauthor, participant: coauthor}
        end
      end
    end

    def client_collaborations_for project_id
      results = query "SELECT distinct pClientCa FROM projectes where pID='#{project_id}'"
      results.each do |row|
        row['pClientCa'].split("&&&").map!(&:strip).each do |client|
          @collaborations << {id: project_id, role: :client, participant: client}
        end
      end
    end

    def commission name
      case name
      when "PU"
        "public" 
      when "PV"
        "private"
      end
    end

    def status name
      case name
      when "CO"
        "competition"
      when "EP"
        "predesign"
      when "AP"
        "schematic_design"
      when "PB"
        "design_development"
      when "PE"
        "final_design"
      when "OB"
        "building"
      when "OA"
        "built"
      end
    end

    def format val
      if val.is_a? Numeric
        val unless val <= 0
      else
        val unless val.strip.empty?
      end
    end

    def published val
      val.to_i == 1 ? true : false
    end

  end

end

