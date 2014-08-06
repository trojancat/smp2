class Meeting < ActiveRecord::Base

  belongs_to              :owner, class_name: User
  belongs_to              :project
  has_and_belongs_to_many :users

  # Статусы
  extend Enumerize
  enumerize :status, in: {
      'открыт' => 1,
      'закрыт' => 2,
  }

  # Валидация
  validates :title, presence: true, length: { maximum: 255 }
  validates :owner, presence: true
  validates :project, presence: true
  validates :status, presence: true, inclusion: { in: self.status.values }
end