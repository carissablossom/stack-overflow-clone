module QuoteGetter
  include HTTParty

  def quote
    HTTParty.get('https://api.github.com/zen', :basic_auth => {:username => 'user', :password => 'pass'})
  end

end


