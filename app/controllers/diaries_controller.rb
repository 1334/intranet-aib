class DiariesController < ApplicationController
  def show
    project = Project.find(params[:project_id])
    @diary = project.diary || project.create_diary!
    redirect_to project_diary_entries_path
  end
end
