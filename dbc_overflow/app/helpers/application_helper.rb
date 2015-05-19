module ApplicationHelper
  include HTTParty

  def self.quote
    quote = HTTParty.get('https://api.github.com/zen').to_s
    if !quote.empty?
      Quote.create(text: quote)
      return quote
    else
      return Quote.find(rand[0...Quote.count])
    end
  end

end
