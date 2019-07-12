# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'factory_bot_rails'

person = FactoryBot.create(:person, name: 'Cassiano Blonski Sampaio', email: 'user@example.com')
project = FactoryBot.create(:project, manager: person)
FactoryBot.create(:history, project: project, requester: person)
FactoryBot.create(:history, :started, project: project, requester: person)
FactoryBot.create(:history, :delivered, project: project, requester: person)
FactoryBot.create(:history, :accepted, project: project, requester: person)

# History with unfinished tasks to
history_with_unfinished_task = FactoryBot.create(:history, :started,
                                            name: 'History with Unfinished Task',
                                            project: project, requester: person)
FactoryBot.create(:task, history: history_with_unfinished_task,
            done: false)
