class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# ENV['GITHUB_LOGIN']
# ENV['GITHUB_TOKEN']

  def github_authorize
    HTTParty.get('https://api.github.com/user', headers: {"User-Agent" => ENV['GITHUB_LOGIN'], "Authorization" => "token " + ENV['GITHUB_TOKEN']})
  end


end

