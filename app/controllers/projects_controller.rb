class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.scoped
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: Project.published.to_json(only: [:code, :name]) }
    end
  end

  def published
    @projects = Project.published 
    render :index
  end
  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project.to_json(include: { collaborations: { include: :participant } } ) }
    end
  end

  # GET /projects/new
  def new
    @project = default_values(Project.new)
    @project.collaborations.build
  end

  # POST /projects
  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.' 
    else
      render action: "new"
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # PUT /projects/1
  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /projects/1
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_url
  end

private

  def default_values(project)
    project.start_year = Time.now.year
    project
  end
end
