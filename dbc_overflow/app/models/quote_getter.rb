class QuoteGetter
  include HTTParty
  base_uri 'https://api.github.com'

  def initialize
    @key = ENV['API_KEY']
    # @base_uri = ENV['HOST']
    @headers = { headers: {"Authorization" => "token " + @key, "User-Agent" => "DBC Overflow"} }
  end

  def get_quote
    @quote = self.class.get('/zen', @headers)
    if @quote.code == 200
      @quote.body
    else
      false
    end
  end
end
