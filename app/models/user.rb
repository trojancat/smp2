class User < ActiveRecord::Base

  # Константы
  TECH_DIR = 1  #Технический директор
  PM = 2        #Проект менеджер
  MEMBER = 3    #Рядовой сотрудник

  # Фильтры
  before_create :set_default_role

  # Аутентификация
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Связи
  has_many                :projects, foreign_key: :owner_id                                   # Проекты, на которые назначен пользователь в качестве ПМ
  has_many                :tasks, foreign_key: :owner_id                                      # Задачи, на которые назначен пользователь в качестве исполнителя
  has_many                :owned_meetings, foreign_key: :owner_id, class_name: Meeting        # Организованные пользователем совещания
  has_and_belongs_to_many :meetings                                                           # Все совещания, в которых участвует пользователь, как простой участник
  has_many                :meeting_entries, foreign_key: :owner_id, class_name: MeetingEntry  # Сообщения пользователя в соотвещаниях
  has_many                :sended_messages, foreign_key: :sender_id, class_name: Message      # Отправленные сообщения
  has_many                :accepted_messages, foreign_key: :acceptor_id, class_name: Message  # Полученные сообщения

  # Роли
  extend Enumerize
  enumerize :role, in: {
      'Технический директор' => self::TECH_DIR,
      'Проект менеджер' => self::PM,
      'Рядовой сотрудник' => self::MEMBER
  }

  private

  # Роль по умолчанию
  def set_default_role
    self.role ||= User::MEMBER
  end
end
