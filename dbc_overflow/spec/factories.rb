FactoryGirl.define do
  factory :question do
    title { Faker::App.name }
    content { Faker::Hacker.say_something_smart }
  end

  factory :answer do
    title { Faker::App.name }
    content { Faker::Hacker.say_something_smart }
  end

end
