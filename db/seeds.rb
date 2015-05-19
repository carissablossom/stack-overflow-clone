require 'faker'

10.times do
  Question.create!(
    title: Faker::Hacker.say_something_smart,
    content: Faker::Lorem.sentences(2).join(' ')
  )
end

Question.all.each do |qu|
  3.times do
    qu.answers << Answer.create!(
      title: Faker::Hacker.verb,
      content: Faker::Hacker.say_something_smart
    )
  end
end
