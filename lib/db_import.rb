ENV["RAILS_ENV"] = "development"
require File.expand_path('../../config/environment', __FILE__)
require 'yaml'
require_relative 'db_export'

module AiB
  class DBImport
    attr_reader :projects, :es_translations, :en_translations, :participants, :collaborations

    def initialize
      params = load_data
      data = AiB::DBExport.new(params).fill_data
      @projects = data.projects[:ca]
      @es_translations = data.projects[:es]
      @en_translations = data.projects[:en]
      @participants = data.participants
      @collaborations = data.collaborations
    end

    def load_data
      {
        host: ENV['LDB_HOST'],
        user: ENV['LDB_USER'],
        password: ENV['LDB_PASSWORD']
      }
    end

    def insert_data!
      insert_projects!
      insert_translations :es
      insert_translations :en
      insert_participants
      insert_collaborations
    end

    private

    def insert_projects!
      @projects.each do |project|
        p = Project.new(project)
        p.id = p.code.to_i
        p.save
      end
    end

    def insert_translations locale
      I18n.locale = locale
      translations = locale == :en ? @en_translations : @es_translations
      translations.each do |translation|
        Project.find(translation[:code]).update_attributes(translation)
      end
    end

    def insert_participants
      @participants.each do |participant|
        Participant.create(name: participant)
      end
    end

    def insert_collaborations
      @collaborations.each do |collaboration|
        pr = Project.find(collaboration[:id])
        pa = Participant.find_by_name(collaboration[:participant])
        c = pr.collaborations.build
        c.participant = pa
        c.role = collaboration[:role]
        pr.save
      end
    end

  end
end

