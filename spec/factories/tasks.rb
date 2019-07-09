FactoryBot.define do
  factory :task do
    description { "MyString" }
    done { false }
    history { nil }
  end
end
