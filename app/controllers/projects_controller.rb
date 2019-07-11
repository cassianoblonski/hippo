class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update, :destroy, ]
  before_action :authenticate_person!

  def index
    @projects = Project.all.order(:name)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.manager = current_person

    if @project.save
      flash[:success] = "Project was successfully created."
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      flash[:success] = "#{@project.name} was successfully updated."
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
