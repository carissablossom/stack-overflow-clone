module QuoteGetter
  include HTTParty

  def quote
    @response = HTTParty.get('https://api.github.com/zen', :basic_auth => {:username => '', :password => ''})
  end

end


