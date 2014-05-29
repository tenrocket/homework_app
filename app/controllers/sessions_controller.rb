class SessionsController < ApplicationController
 def new
 end

 def create
 	user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
 	if user
 		session[:user_id] = user.id
 		redirect_to users_path, notice: "logged in"
 	end
 end

 def destroy
 	session[:user_id] = nil
 	redirect_to users_path
 end


end