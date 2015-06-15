module QuoteGetter
  include HTTParty

  def quote
    HTTParty.get('https://api.github.com/zen', :basic_auth => {:username => 'throwawayuser', :password => 'throwawayuser1'})
  end

end


