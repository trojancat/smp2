class Task < ActiveRecord::Base

  OPENED = 1;   # Открыта
  CLOSED = 2;   # Закрыта

  PER_PAGE = 10 # Элементов на странице при постраничном выводе

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

  scope :page_by_page, ->(page) { includes(:owner).paginate(:page => page, :per_page => self::PER_PAGE).order('created_at DESC') }
  scope :by_user, ->(user) { where(owner_id: user) }
end
