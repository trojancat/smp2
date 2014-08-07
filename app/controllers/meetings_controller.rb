class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :edit, :update, :destroy]

  # Список совещания
  def index
    @meetings = Meeting.page_by_page(params[:page])
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
    logger.debug "New meeting: #{@meeting.attributes.inspect}"
    logger.debug "Meeting should be valid: #{@meeting.valid?}"
    if @meeting.save
      redirect_to meetings_path
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
      redirect_to meeting_path
    else
      render :edit
    end
  end

  # Удалить совещание
  def destroy
    @meeting.destroy
    redirect_to meetings_path
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:title, :description, :status, :project_id)
  end
end
