class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  # Список проектов
  def index
    @projects = Project.includes(:owner).paginate(:page => params[:page]).order('created_at DESC')
  end

  # Страница проекта
  def show
  end

  # Новый проект
  def new
    @project = Project.new
  end

  # Создать проект
  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  # Ищзменить проект
  def edit
  end

  # Обновить проект
  def update
    if @project.update(project_params)
      redirect_to project_path
    else
      render :edit
    end
  end

  # Удалить проект
  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :status)
  end
end
