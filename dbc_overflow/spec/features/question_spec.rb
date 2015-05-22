Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe "Question", js: true do
  let!(:question) { FactoryGirl.create :question }

  it 'should visit page to check if title exists' do
    visit root_path
    expect(page).to have_content(question.title)
  end

  it 'should visit page to check if content exists' do
    visit root_path
    expect(page).to have_content(question.content)
  end

  it 'upvotes a question' do
    visit root_path
    page.find('.up_tri').click
    expect(page.find('#question_container .votes').text).to have_content("vote totals: 1")
  end

  it 'downvotes a question' do
    visit root_path
    page.find('.down_tri').click
    expect(page.find('#question_container .votes').text).to have_content("vote totals: -1")
  end

end
