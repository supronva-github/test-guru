# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Data is loading'

users = User.create([
                      { first_name: 'Vitaliy', last_name: 'Bax', email: 'v.bax@gmail.com' },
                      { first_name: 'Roma', last_name: 'Kirpich', email: 'r.kirpich@gmail.com' },
                      { first_name: 'Maksim', last_name: 'Orel', email: 'm.orel@gmail.com' }
                    ])

categories = Category.create([
                               { title: 'Front-end' },
                               { title: 'Back-end' },
                               { title: 'DevOps' }
                             ])

tests = Test.create([
                      { title: 'Принципы ООП', level: 1, category: categories[1], author: users[2] },
                      { title: 'Модель OSI', level: 1, category: categories[2], author: users[2] },
                      { title: 'Linux OS', level: 1, category: categories[2], author: users[2] },
                      { title: 'Ruby on Rails', level: 3, category: categories[1], author: users[1] },
                      { title: 'HTML Styles CSS', level: 2, category: categories[0], author: users[2] },
                      { title: 'Kubernetes', level: 3, category: categories[2], author: users[2] }
                    ])

questions = Question.create([
                              { body: 'Назовите основные принципы ООП', test: tests[0] },
                              { body: 'Как оставновить процесс в Linux?', test: tests[2] },
                              { body: 'Как создавать файлы в Linux?', test: tests[2] },
                              { body: 'Какие есть типы переменных в Ruby?', test: tests[3] },
                              { body: 'Что такое Bundler и для чего используется ?', test: tests[3] },
                              { body: 'Какие есть модификаторы доступа в Ruby?', test: tests[3] },
                              { body: 'Можно ли подключить внешний файл CSS в браузере?', test: tests[4] }
                            ])

answers = Answer.create([
                          { body: 'Для создания файлов используйте команду touch', correct: true,
                            question: questions[2] },
                          { body: 'Остановить процесс с помощью команды kill', correct: true, question: questions[1] },
                          { body: 'Локальные, переменные инстенса и класса', question: questions[3] },
                          { body: 'Локальные, глобальные, переменные инстенса и класса', correct: true,
                            question: questions[3] },
                          { body: 'Это менеджер для управления зависимостями gem-ов в ruby приложениях', correct: true,
                            question: questions[4] },
                          { body: 'Public, Private', correct: true, question: questions[5] },
                          { body: 'Public, Protected, Private', correct: true, question: questions[5] },
                          { body: 'Нет,нельзя', correct: true, question: questions[6] },
                          { body: 'Абстракция, наследование, инкапсуляция, полиморфизм', correct: true,
                            question: questions[0] }
                        ])

users_tests = UsersTest.create([
                                 { user: users[2], test: tests[1] },
                                 { user: users[2], test: tests[2] },
                                 { user: users[0], test: tests[0] },
                                 { user: users[0], test: tests[4] },
                                 { user: users[1], test: tests[5] },
                                 { user: users[1], test: tests[2] }
                               ])

puts 'Data loaded!'
