class Project < ActiveRecord::Base

  OPENED = 1    #Открыт
  CLOSED = 2    #Закрыт

  PER_PAGE = 10 # Элементов на странице при постраничном выводе

  belongs_to  :owner, class_name: User
  has_many    :tasks

  # Статусы
  extend Enumerize
  enumerize :status, in: {
      'Открыт' => self::OPENED,
      'Закрыт' => self::CLOSED,
  }

  # Валидация
  validates :title, presence: true, length: { maximum: 255 }
  validates :owner, presence: true
  validates :status,  presence: true, inclusion: { in: [self::OPENED, self::CLOSED] }

  scope :page_by_page, ->(page) { includes(:owner).paginate(:page => page, :per_page => self::PER_PAGE).order('created_at DESC') }
end