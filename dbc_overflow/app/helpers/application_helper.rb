module ApplicationHelper
  include HTTParty

  def self.quote
    quote = HTTParty.get('https://api.github.com/zen')
    if quote.message != "Forbidden"
      Quote.create(text: quote.to_s)
      return quote
    else
      begin
        Quote.find(rand(0...(Quote.count))).text
      rescue Exception => e
        quote = ''
      end
    end
  end

end
