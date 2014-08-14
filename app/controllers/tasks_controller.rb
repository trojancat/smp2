class TasksController < ApplicationController
  load_resource :project, except: [:my]
  load_resource :task, through: :project, except: [:my]

  def index
    @tasks = Task.by_project(@project).page_by_page(params[:page])
  end

  # Мои задачи
  def my
    @tasks = Task.by_user(current_user).page_by_page(params[:page])
    render :index
  end

  def show
  end

  def new
  end

  def create
    @task = @project.tasks.new(task_params)
    if @task.save
      redirect_to project_tasks_path(@project)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@project, @task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(@project)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :owner_id, :status)
  end
end
