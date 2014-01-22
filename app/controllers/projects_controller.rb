class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project has been created"
      redirect_to @project
    else
      flash[:alert] = "Project could not be saved"
      render :new
    end
  end

  def edit
    # @project = Project.find(params[:id])
  end

 def update
  # @project = Project.find(params[:id])
  if @project.update(project_params)
    flash[:success] = "Project was Successfully updated"
    redirect_to @project
  else
    render :edit
  end
 end

  def show
    # @project = Project.find(params[:id])
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end
end
