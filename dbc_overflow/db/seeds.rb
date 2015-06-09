# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questions = Question.create([
  { title: 'Is Conch Shell pronounced "contch" or "conque"?', 
    content: 'I have a friend who seems to pronounce conch like "contch".. Is that correct?' },
  { title: 'Why is Jerome such a dingleberry?', 
    content: 'My friend Jerome is sensitive and weird... would you consider him a db?' },
  { title: 'How many times is it possible to be struck by lightening without dying?', 
    content: 'My friend has been struck by lightening seven times.. and he is still alive' },
  { title: 'What is the best programming language to start learning?', 
    content: 'I want to start programming, but I do not know the best language to learn' },
  { title: 'How do you create an index file in rails?', 
    content: 'I want to create a front page for my rails application, how to?' },
  { title: 'What are the steps for setting up rails?', 
    content: 'I want to create a new rails application... but I do not know how' },
  { title: 'Why Rails?', 
    content: 'I have heard a lot about rails, but why should I use it?' },
  { title: 'How can I further break Jacob\'s toe?', 
    content: 'I want to break my firend\'s already broken toe' },
  { title: 'Is it Action Hank or Hector?', 
    content: 'I have a friend that looks like a Hector, but he is also really actionable... what should I call him?' },
  { title: 'What is the best cohort ever?', 
    content: 'I want to figure out what the best cohort is and why!' },
  { title: 'Why are we still getting sandwiches from Specialties?', 
    content: 'We get these sandwiches every third monday and I want to know why we get them from where we get them.. cause they be gross doe.' }])



