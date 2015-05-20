module Zen
  extend ActiveSupport::Concern

  def get_quote
    response = HTTParty.get(
      'https://api.github.com/zen',
      headers: {"User-Agent" => 'SF Dev BootCamp'},
      basic_auth: {username: ENV['USERNAME'], password: ENV['PASSWORD']}
    )
    if response.response.code == "200"
      Quote.create(content: response.parsed_response)
    else
      Quote.all.sample || Quote.new
    end
  end
end
