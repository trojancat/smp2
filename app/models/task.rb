class Task < ActiveRecord::Base

  OPENED = 1    #Открыт
  CLOSED = 2    #Закрыт

  belongs_to :project
  belongs_to :owner, class_name: User

  # Статусы
  extend Enumerize
  enumerize :status, in: {
      'открыта' => self::OPENED,
      'закрыта' => self::CLOSED,
  }

  # Валидация
  validates :title, presence: true, length: { maximum: 255 }
  validates :owner, presence: true
  validates :project, presence: true
  validates :status, presence: true, inclusion: { in: self.status.values }

end
