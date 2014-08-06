class Message < ActiveRecord::Base

  belongs_to  :sender, class_name: User
  belongs_to  :acceptor, class_name: User

  # Статусы
  extend Enumerize
  enumerize :status, in: {
      'новое' => 1,
      'прочитанное' => 2,
  }

  # Валидация
  validates :title, presence: true, length: { maximum: 255 }
  validates :sender, :acceptor, :body, presence: true
  validates :status, presence: true, inclusion: { in: self.status.values }
end