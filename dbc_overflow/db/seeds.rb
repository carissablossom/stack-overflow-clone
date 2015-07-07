# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

Tag.create([
            {name: "JSON"},
            {name: "Ruby"},
            {name: "Javascript"},
            {name: "Java"},
            {name: "C"},
            {name: "C++"},
            {name: "Objective C"},
            {name: "Swift"},
            {name: "ActiveRecord"},
            {name: "Rails"},
            {name: "SQL"},
            {name: "JQuery"},
            {name: "Ajax"},
          ])

User.create(
    username: "CaptainPlanet",
    email: "a@aol.com",
    password: 'password'
    )

20.times do
  User.create(
    username: "#{Faker::Internet.domain_word}",
    email: "#{Faker::Internet.domain_word}@aol.com",
    password: 'password'
    )
end

60.times do
  user = (1 + rand(21))
  Question.create(
    user_id: user,
    title: "#{Faker::Lorem.sentence}?",
    content: "#{Faker::Lorem.paragraph}"
    )
end

15.times do
  user = (1 + rand(21))
  question = (1 + rand(60))
  Answer.create(
    user_id: user,
    question_id: question,
    content: "#{Faker::Lorem.sentence}"
    ) if Question.find(question).user_id != user
end

