class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.where(username: params[:session][:username]).first

  	if @user && (@user.password == params[:session][:password])
      session[:user_id] = @user.id
  		redirect_to root_url
  	else
  		@signin_error = "Username/Password invalid. Please try again."
  		render 'new'
  	end
  end

  def destroy
		session[:user_id] = nil
  	redirect_to root_url
  end
end
