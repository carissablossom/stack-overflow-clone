user1 = User.create(handle: "tom", email: "tom@tom.com", password: "tomtom")
question1 = Question.create(user_id: user1.id, title: "Test question", content: "Is this a question?")
answer1 = Answer.create(question_id: question1.id, user_id: user1.id, title: "Test answer", content: "Yes it is")
