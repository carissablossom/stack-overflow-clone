# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Question.create(title:"Who will win the NBA Finals?", content:"Warriors in 6")
Question.create(title:"Who will win the NBA Finals?", content:"Cleveland in 6")
Answer.create(title:"Test Answer", content:"Test Content", question_id:1)
Answer.create(title:"Test Answer 2", content:"Test Content 2", question_id:2)
