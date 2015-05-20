module ApplicationHelper
  include HTTParty

  def self.quote
    quote = HTTParty.get('https://api.github.com/zen')
    if quote.message != "Forbidden"
      Quote.create(text: quote.to_s)
      return quote
    else
      Quote.find(rand(0...(Quote.count))).text
    end
  end

end
