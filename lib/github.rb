module Github
  QUOTES = [
    "don't call so much",
    "do you even HTTParty bro?",
  ]
  def self.quote
    # response = HTTParty.get("https://api.github.com/zen", headers: {"User-Agent" => 'dbcflow', "Authorization" => ENV['CLIENT_ID']})
    response = HTTParty.get("https://#{ENV['USERNAME']}:#{ENV['TOKEN']}@api.github.com/zen")
    p "**************************************************"
    p response
    response.code == 200 ?  response.parsed_response : QUOTES.sample
  end
end

