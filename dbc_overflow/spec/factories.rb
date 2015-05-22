FactoryGirl.define do
  factory :question do
    title { Faker::App.name }
    content { Faker::Hacker.say_something_smart }
  end
end
