# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Создаем демо пользователя
User.first_or_create(:email => 'VasyaPupkin@gmail.com',
                     :password => 'veryhardpassword123',
                     :name =>'Вася Пупки',
                     :role => 1)