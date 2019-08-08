class SessionsController < ApplicationController
  def new
  	
  end

  def create
  	user = User.find_by(email: params[:session][:email])
 		if user && user.authenticate(params[:session][:password])
 			session[:user_id] = user.id
 			redirect_to user_path(user.id)
 			flash[:success] = 'Tu es bien connecté.'
 		else
 			flash[:danger] = 'Invalid email/password combination'
 			render :new
 		end
  end

  def destroy
  	session.delete(:user_id)
  	redirect_to gossips_path
  end
end
