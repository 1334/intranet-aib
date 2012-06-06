class EntriesController < ApplicationController
  before_filter :get_project

  def index
    @entries = @project.diary.entries
  end
  def new
    @path = project_diary_entries_path(@project)
    @entry = @project.diary.entries.build 
  end

  def create
    @entry = @project.diary.entries.create(params[:entry])
    
    if @entry.save
      redirect_to project_diary_entries_path(@project), notice: 'Entry was successfully created.' 
    else
      @path = project_diary_entries_path(@project)
      render action: "new"
    end
  end

  def edit
    @path = project_diary_entry_path(@project)
    @entry = Entry.find(params[:id]) 
  end

  def update
    # raise
    @entry = Entry.find(params[:id]) 
    if @entry.update_attributes(params[:entry])
      redirect_to project_diary_entries_path(@project), notice: 'Entry was successfully updated.'
    else
      @path = project_diary_entry_path(@project)
      render action: "edit"
    end
  end

  private

    def get_project
      @project = Project.find(params[:project_id])
    end
end
