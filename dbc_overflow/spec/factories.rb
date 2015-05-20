FactoryGirl.define do
  factory :question do
    title { Faker::Hacker.abbreviation }
    content { Faker::Hacker.say_something_smart }
  end
end

FactoryGirl.define do
  factory :answer do
    content { Faker::Hacker.say_something_smart }
  end
end
