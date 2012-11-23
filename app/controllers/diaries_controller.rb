class DiariesController < ApplicationController
  def show
    Project.find(params[:project_id]).diary 
    redirect_to project_diary_entries_path
  end

  def new
    Project.find(params[:project_id]).create_diary!
    redirect_to project_diary_entries_path
  end
end
