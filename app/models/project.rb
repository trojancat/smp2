class Project < ActiveRecord::Base

  OPENED = 1;   # Открыт
  CLOSED = 2;   # Закрыт

  PER_PAGE = 10 # Элементов на странице при постраничном выводе

  belongs_to  :owner, class_name: User
  has_many    :tasks
  has_many    :meetings

  # Статусы
  extend Enumerize
  enumerize :status, in: {
      'открыт' => self::OPENED,
      'закрыт' => self::CLOSED,
  }

  # Валидация
  validates :title, presence: true, length: { maximum: 255 }
  validates :owner, presence: true
  validates :status, presence: true, inclusion: { in: self.status.values }

  scope :page_by_page, ->(page) { includes(:owner, :tasks).paginate(:page => page, :per_page => self::PER_PAGE).order('created_at DESC') }
  scope :by_user, ->(user) { where(owner_id: user) }
end