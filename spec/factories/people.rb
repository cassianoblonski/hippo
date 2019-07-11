FactoryBot.define do
  factory :person do
    name                  { Faker::Name.unique.name }
    email                 { Faker::Internet.unique.email }
    password              { 'password' }
    password_confirmation { 'password' }
  end
end
