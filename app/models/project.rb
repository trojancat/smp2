class Project < ActiveRecord::Base

  OPENED = 1  #Открыт
  CLOSED = 2  #Закрыт

  belongs_to  :owner, class_name: User
  has_many    :tasks

  # Статусы
  extend Enumerize
  enumerize :status, in: {
      'Открыт' => self::OPENED,
      'Закрыт' => self::CLOSED,
  }
end