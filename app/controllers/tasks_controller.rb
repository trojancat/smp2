class TasksController < ApplicationController
  load_resource :project
  load_resource :task, through: :project

  def index
    @tasks = Task.page_by_page(params[:page])
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
  end

  def destroy
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :owner_id, :status)
  end
end
