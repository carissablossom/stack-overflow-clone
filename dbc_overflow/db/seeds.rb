# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "faker"

User.create(
    username: "CaptainPlanet",
    email: "a@aol.com",
    password: 'password'
    )

24.times do
  User.create(
    username: "#{Faker::Internet.domain_word}",
    email: "#{Faker::Internet.domain_word}@aol.com",
    password: 'password'
    )
end

60.times do
  user = (1 + rand(25))
  Question.create(
    user_id: user,
    title: "#{Faker::Lorem.sentence}?",
    content: "#{Faker::Lorem.paragraph}"
    )
end

240.times do
  user = (1 + rand(25))
  question = (1 + rand(60))
  Answer.create(
    user_id: user,
    question_id: question,
    content: "#{Faker::Lorem.sentence}"
    ) if Question.find(question).user_id != user
end

600.times do
  coin_toss = rand(1)
  user = (1 + rand(25))

  if coin_toss == 0
    answer = (1 + rand(Answer.all.length))
    Answer.find(answer).comments.create(user_id: user, content: "#{Faker::Lorem.sentence}")
  else
    question = (1 + rand(60))
    Question.find(question).comments.create(user_id: user, content: "#{Faker::Lorem.sentence}")
  end
end

1000.times do
  coin_toss = rand(1)
  user = (1 + rand(25))

  if coin_toss == 0
    answer = (1 + rand(Answer.all.length))
    Answer.find(answer).votes.create(user_id: user, eval: 0) if
    !Answer.find(answer).votes.where(user_id: user).first
  else
    question = (1 + rand(60))
    Question.find(question).votes.create(user_id: user, eval: 1) if
    !Question.find(question).votes.where(user_id: user).first
  end
end

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

180.times do
  tag = (1 + rand(13))
  question = (1 + rand(60))
  QuestionTag.create(question_id: question, tag_id: tag) if
  !QuestionTag.where(question_id: question, tag_id: tag).first
end

80.times do
  user = (1 + rand(25))
  question = (1 + rand(60))
  FavoriteQuestion.create(user_id: user, question_id: question) if
  !FavoriteQuestion.where(user_id: user, question_id: question).first &&
  Question.find(question).user_id != user
end

30.times do
  question = (1 + rand(60))
  answer = (1 + rand(Answer.all.length))
  FavoriteAnswer.create(question_id: question, answer_id: answer) if
  !FavoriteAnswer.where(question_id: question, answer_id: answer).first &&
  FavoriteAnswer.where(question_id: question, answer_id: answer).exists?
end
