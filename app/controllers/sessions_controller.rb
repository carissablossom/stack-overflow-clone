class SessionsController < ApplicationController
  def new

  end

  def create
  	@user = User.where(username: params[:session][:username]).first

  	if @user && (@user.password == params[:session][:password])
  		p "^ " * 50
      p session[:user_id] = @user.id
      p "^ " * 50
      
  		redirect_to root_url
  	else
  		@signin_error = "Username/Password invalid. Please try again."
  		# checkout Hartl Ch.8 for implementing flash msgs to catch session errors
  		render 'new'
  	end
  end

  def destroy
		session[:user_id] = nil
  	redirect_to root_url
  end
end
