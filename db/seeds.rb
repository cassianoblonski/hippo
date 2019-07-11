# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

person = Person.create(name: 'Cassiano Blonski Sampaio', email: 'cassianobsampaio@gmail.com')
project = Project.create(name: 'Hippo', manager_id: person.id)
history = History.create(name: 'Add teams', requester_id: person.id,
                          description: 'Add teams to Hippo so we can separate
                          users by teams and allow multiple companies using the same website.',
                          points: 3
                          )
