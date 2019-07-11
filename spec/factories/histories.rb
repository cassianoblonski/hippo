FactoryBot.define do
  factory :history do
    name { "Create #{Faker::Lorem.word}" }
    points { 1 }
    status { "pending" }
    description { "Description example for history" }
    requester { create(:person) }
    owner { create(:person) }
    project { create(:project, manager: requester) }
    deadline { 1.week.from_now }
  end

  trait :started do
    status { "started" }
  end

  trait :delivered do
    status { "delivered" }
  end

  trait :accepted do
    status { "accepted" }
  end
end
