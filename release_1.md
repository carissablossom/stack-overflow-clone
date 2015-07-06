# Release 1: Starting from Scratch

### Learning Competencies

- Ability to generate a Rails app
- Ability to implement CRUD the Rails way
- Ability to use the `form_for` helper

### Summary

This week, we'll be building a substantial Rails application from the ground up: a [StackOverflow](http://www.stackoverflow.com) clone.  The goal is to focus on building a well-structured Rails application with a good mixture of front-end and back-end features.

You are training to be a professional developer, and its time to start acting like one. For the remainder of this project, you should:

***Commit early and commit often.***  Commit on every feature completion, added dependency, and work stoppage. Commit with meaningful messages that accurately describe your alterations.

***Be intentional about your time and learning.*** Focus on understanding every line of code that you write, and why you are writing it. The result should be a codebase that is clean, intentional, and ready for production.
  
First, let's check our installed version of Rails:

```sh
  $ rails -v
```

Your Rails version should be `4.x`.

To create a new Rails 4 application with a postgres database and without the default testing framework, run:

```sh
  $ rails new dbc_overflow -T -d=postgresql
```

You'll also need to install `rspec-rails`, `capybara`, `shoulda-matchers`, and `factory_girl` in your project.

## Tasks

0. Create a valid `README` with your project's intention.
0. Implement the following features:
  0. As a user, I should be able to post a question with a title and content.
  0. As a user, I should be able to see a list of questions.
0. Deploy to heroku
