FactoryBot.define do
  factory :project do
    name { Faker::Company.unique.name }
    manager { create(:person) }
  end
end
