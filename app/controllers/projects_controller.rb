class ProjectsController < ApplicationController
  load_resource :project

  # Список проектов
  def index
    @projects = Project.page_by_page(params[:page])
  end

  # Мои проекты
  def my
    @projects = Project.by_user(current_user).page_by_page(params[:page])
    render :index
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

  # Изменить проект
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

  def project_params
    params.require(:project).permit(:title, :description, :status)
  end
end
