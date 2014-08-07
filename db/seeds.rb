# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Демо Пользователи:
User.first_or_create(:email => 'VasyaPupkin@gmail.com',
                     :password => 'veryhardpassword123',
                     :name =>'Вася Пупки',
                     :role => 'Технический директор')
User.first_or_create(:email => 'SergGav@gmail.com',
                     :password => 'veryhardpassword123',
                     :name =>'Сергей Гаврилов',
                     :role => 'Рядовой сотрудник')
User.first_or_create(:email => 'KamilUraz@gmail.com',
                     :password => 'veryhardpassword123',
                     :name =>'Камиль Уразбахтин',
                     :role => 'Рядовой сотрудник')
User.first_or_create(:email => 'Olesa@gmail.com',
                     :password => 'veryhardpassword123',
                     :name =>'Олес Куруленко',
                     :role => 'Рядовой сотрудник')
User.first_or_create(:email => 'Dinara@gmail.com',
                     :password => 'veryhardpassword123',
                     :name =>'Динара Хамзина',
                     :role => 'Рядовой сотрудник')

# Демо Проекты:
user = User.where('role = 1').first
Project.first_or_create(title: 'Система для автоматизации заправок',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Аналитическая система для СЕО',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Гео-сервис',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Портал недвижимости Красноярска',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Интернет-магазин "Лунтик"',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Новостной портал "Ведомости"',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Бинзнес-инкубатор on-line',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Интерактивная обучающая система',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Площадка для тендерных торгов',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Доработка корпоративного портала ООО "Омега"',
                        status: 'открыт',
                        owner: user)
Project.first_or_create(title: 'Форум для родителец',
                        status: 'открыт',
                        owner: user)
