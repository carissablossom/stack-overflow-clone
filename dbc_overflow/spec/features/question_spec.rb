Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

describe "Question", js: true do
  it 'should visit page' do
    visit root_path
  end
end
