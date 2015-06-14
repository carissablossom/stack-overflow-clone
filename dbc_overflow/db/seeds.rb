# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create(title: "Question Test 1", content: "Question Content 1")
Question.create(title: "Question Test 2", content: "Question Content 2")
Question.create(title: "Question Test 3", content: "Question Content 3")
Question.create(title: "Question Test 4", content: "Question Content 4")
Question.create(title: "Question Test 5", content: "Question Content 5")

Answer.create(title: "Answer Test 1", content: "Answer Content 1", question_id: 1)
Answer.create(title: "Answer Test 2", content: "Answer Content 2", question_id: 2)
Answer.create(title: "Answer Test 3", content: "Answer Content 3", question_id: 3)
Answer.create(title: "Answer Test 4", content: "Answer Content 4", question_id: 4)
Answer.create(title: "Answer Test 5", content: "Answer Content 5", question_id: 5)


