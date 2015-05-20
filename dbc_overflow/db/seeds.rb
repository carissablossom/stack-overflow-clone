# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

100.times do
  question = Question.create(title: Faker::Hacker.abbreviation, content: Faker::Hacker.say_something_smart)
  answer = Answer.create(content: Faker::Hacker.say_something_smart)
  answer1 = Answer.create(content: Faker::Hacker.say_something_smart)
  question.answers << answer
  question.answers << answer1
end
