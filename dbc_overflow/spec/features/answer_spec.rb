Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

require 'pry'

describe "Answer", js: true do
  let!(:question) { FactoryGirl.create :question }
  let!(:answer) { FactoryGirl.create :answer }

  it 'should visit page to check if title exists' do
    visit root_path
    # click_on(page.first(find('.uhhh a')))
    page.find('a h1').click
    # click_on(page.find_link(question.title).text)
    expect(page.find('h3').last.text).to have_content(question.title)
  end

# post = $('.uhhh')[0]
# $(post).children('a').first()[0]

#   it 'should visit page to check if content exists' do
#     visit root_path
#     expect(page).to have_content(answer.content)
#   end

#   it 'upvotes a answer' do
#     visit root_path
#     page.find('.up_tri').click
#     expect(page.find('#answer_container .votes').text).to have_content("vote totals: 1")
#   end

#   it 'downvotes a answer' do
#     visit root_path
#     page.find('.down_tri').click
#     expect(page.find('#answer_container .votes').text).to have_content("vote totals: -1")
#   end

#   it 'ensures answer title and content form' do
#     visit root_path
#     fill_in 'Title', with: answer.title
#     fill_in 'Content', with: answer.content
#     click_on("Create Answer")
#     expect(page).to have_content(answer.title)
#     expect(page).to have_content(answer.content)
#   end

end
