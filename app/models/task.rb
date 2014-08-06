class Task < ActiveRecord::Base

  belongs_to :project
  belongs_to :owner, class_name: User

  # Статусы
  extend Enumerize
  enumerize :status, in: {
      'открыта' => 1,
      'закрыта' => 2,
  }

  # Валидация
  validates :title, presence: true, length: { maximum: 255 }
  validates :owner, presence: true
  validates :project, presence: true
  validates :status, presence: true, inclusion: { in: self.status.values }

end
