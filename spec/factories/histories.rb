FactoryBot.define do
  factory :history do
    name { "MyString" }
    status { "MyString" }
    description { "MyText" }
    deadline { "2019-07-08 10:26:38" }
    points { 1 }
    project { nil }
    person { nil }
  end
end
