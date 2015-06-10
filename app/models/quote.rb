class Quote < ActiveRecord::Base

  def self.fetch
    quote = HTTParty.get('https://api.github.com/zen', headers: { "User-Agent" => "stack overflow", "Authorization" => "token #{ ENV['TOKEN'] }" } )
    unless quote["message"]
      return quote
    else
      return Quote.all.sample.content
    end
  end
end
