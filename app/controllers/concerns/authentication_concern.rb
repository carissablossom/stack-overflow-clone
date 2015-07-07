module AuthenticationConcern

  extend ActiveSupport::Concern
  included do
    helper_method :current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end


# http://api.rubyonrails.org/classes/ActiveSupport/Concern.html
# READ THIS
