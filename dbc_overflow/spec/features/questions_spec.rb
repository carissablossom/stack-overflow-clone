
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe "question", :js => true do
  let!(:question) {FactoryGirl.build :question}
  before do
    visit root_path
    fill_in 'Title', with: question.title
    fill_in 'Content', with: question.content
    click_on('Create Question')
  end
  it "creates a new question" do
    expect(page).to have_content(question.title)
  end

  it "navigates to a full question page" do

    puts "wtf? #{page.html}"
    click_on(question.title)
    expect(page).to have_content(question.content)
  end

  it "deletes a question and returns to index" do
    click_on(question.title)
    click_on("Delete Question")
    # click_on("OK")
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content('DBC Overflow')
  end

  it "edits a question and displays updated content" do
    click_on(question.title)
    click_on("Edit Question")
    fresh_content = Faker::Hacker.say_something_smart
    fill_in 'Content', with: fresh_content
    click_on("Update Question")
    expect(page).to have_content(fresh_content)
  end

  it "upvotes a question" do
    click_on(question.title)
    click_on("▲")
    expect(page.first('div.question span').text).to have_content("2")
  end
end

