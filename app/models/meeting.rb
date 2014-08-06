class Meeting < ActiveRecord::Base

  OPENED = 1    #Открыт
  CLOSED = 2    #Закрыт

  belongs_to              :owner, class_name: User
  belongs_to              :project
  has_and_belongs_to_many :users

  # Статусы
  extend Enumerize
  enumerize :status, in: {
      'открыт' => self::OPENED,
      'закрыт' => self::CLOSED,
  }

  # Валидация
  validates :title, presence: true, length: { maximum: 255 }
  validates :owner, presence: true
  validates :project, presence: true
  validates :status, presence: true, inclusion: { in: self.status.values }
end