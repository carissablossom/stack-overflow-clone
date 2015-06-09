#Creating a duplicate of the web application "Stack Overflow"
#For starters we need to run
(To see if we have rails install and what version it's on)
    run: rails -v 
    
Next, we need to create a new rails application:
    run: rails new dbc_overflow -T -d=postgresql

You'll also need to install:
    rspec-rails 
    capybara 
    shoulda-matchers 
    factory_girl


Next, we will want to create our models / migrations. 
    run: bin/rails g model Answer content:text
    run: bin/rails g model Question title:string content:text


After, we will want to set up our controller 
    run: bin/rails g controller welcome index 
    (This gives us an index page to work with)
    run: bin/rails g controller answer index
    run: bin/rails g controller question index


Next, we will want to migrate our database
    run: bin/rails db:create 
    run: bin/rails db:migrate
    ( run: bin/rails db:reset )
# We Now have a simple app built that does nothing, but has
# all of its models, controllers, and migrations. 
