# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#(new and save) is create
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

question1 = {title: "the first question" , content: "content for first question is longer"}
question2 = {title: "the second question" , content: "content for second question is longer"}

Question.create(question1)
Question.create(question2)

answer1 = {question_id: 1, title: "the first answer" , content: "content for first answer is longer"}
answer2 = {question_id: 1, title: "the second answer" , content: "content for second answer is longer"}
answer3 = {question_id: 2, title: "the third answer" , content: "content for third answer is longer"}
answer4 = {question_id: 2, title: "the fourth answer" , content: "content for fourth answer is longer"}

Answer.create(answer1)
Answer.create(answer2)
Answer.create(answer3)
Answer.create(answer4)


