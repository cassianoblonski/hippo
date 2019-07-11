FactoryBot.define do
  factory :task do
    history { create(:history) }
    sequence(:description) { |n| "Task #{n}" }
    done { false }
  end
end
