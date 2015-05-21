FactoryGirl.define do
  factory :question do
    title { Faker::Lorem.sentence }
    content { Faker::Hacker.say_something_smart }
  end
end
