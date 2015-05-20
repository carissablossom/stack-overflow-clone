

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe "Question", :js => true do
  let!(:question) { FactoryGirl.create :question}

  it "Shows a list of questions" do
    visit root_path
    expect(page).to have_content(question.title)
  end

end
