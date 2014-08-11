class Meeting < ActiveRecord::Base

  PER_PAGE = 10 # Элементов на странице при постраничном выводе

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

  scope :page_by_page, ->(page) { includes(:owner, :project).paginate(:page => page, :per_page => self::PER_PAGE).order('created_at DESC') }

end