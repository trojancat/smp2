class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many                :projects, foreign_key: :owner_id                                   # Проекты, на которые назначен пользователь в качестве ПМ
  has_many                :tasks, foreign_key: :owner_id                                      # Задачи, на которые назначен пользователь в качестве исполнителя
  has_many                :owned_meetings, foreign_key: :owner_id, class_name: Meeting        # Организованные пользователем совещания
  has_and_belongs_to_many :meetings                                                           # Все совещания, в которых участвует пользователь, как простой участник
  has_many                :meeting_entries, foreign_key: :owner_id, class_name: MeetingEntry  # Сообщения пользователя в соотвещаниях
  has_many                :sended_messages, foreign_key: :sender_id, class_name: Message      # Отправленные сообщения
  has_many                :accepted_messages, foreign_key: :acceptor_id, class_name: Message  # Полученные сообщения

  # Роли
  extend Enumerize
  enumerize :role, in: { admin: 1, member: 2, manager: 3 }

end
