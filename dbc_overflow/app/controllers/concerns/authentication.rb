module Authentication
  extend ActiveSupport::Concern
  headers = {"User-Agent" => "Poop"}
  basic_auth ={:username => ENV['USERNAME'], :password => ENV['PASSWORD']}

  @response = HTTParty.get(
    'https://api.github.com/zen',
    headers: headers,
    basic_auth: basic_auth
  )

end
