class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Роли
  extend Enumerize
  enumerize :role, in: { admin: 1, member: 2, manager: 3 }

end
