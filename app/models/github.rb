module Github
  extend self

  def zen
    response = HTTParty.get("https://#{ENV['USERNAME']}:#{ENV['TOKEN']}@api.github.com/zen")


    if response.code == 200
      response.body
    else
      "Oops! Something went wrong :( Try again!"
    end
  end
end
