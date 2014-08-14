class MeetingsController < ApplicationController
  load_resource :project
  load_resource :meeting, through: :project

  # Список совещаний
  def index
    @meetings = Meeting.by_project(@project).page_by_page(params[:page])
  end

  # Страница совещания
  def show
  end

  # Новое совещание
  def new
    @meeting = Meeting.new
  end

  # Создать совещание
  def create
    @meeting = current_user.owned_meetings.new(meeting_params)
    @meeting.project_id = @project.id
    if @meeting.save
      redirect_to  project_meetings_path(@project)
    else
      render :new
    end
  end

  # Изменить совещание
  def edit
  end

  # Обновить совещание
  def update
    if @meeting.update(meeting_params)
      redirect_to project_meeting_path(@project, @meeting)
    else
      render :edit
    end
  end

  # Удалить совещание
  def destroy
    @meeting.destroy
    redirect_to project_meetings_path(@project)
  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :description, :status, :project_id, :owner_id)
  end
end
