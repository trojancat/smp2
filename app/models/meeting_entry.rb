class MeetingEntry < ActiveRecord::Base
  belongs_to :owner, class_name: User
  belongs_to :meeting

  # Валидация
  validates :owner, presence: true
  validates :meeting, presence: true
end