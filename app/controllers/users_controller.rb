class UsersController < ApplicationController
 	load_and_authorize_resource param_method: :homeworks_params
 def index
 	@users = User.all
 end

 def new
 	@new_user = User.new
 end

 def create
 	@new_user = User.new(user_params)
 	my_string = @new_user.email
	if my_string.include? "@theironyard.com"
   	@new_user.admin = "teacher"
	end
 	if @new_user.save
 		redirect_to login_path
 	else
 		render new_user_path, notice: "you have failed to sign up"
 	end
 end

 def show
 	@user = User.find(params[:id])
 end


def change_admin_status
		@user = User.find(params[:id])
		if @user.admin =="teacher"
			val = "student"
		else
			val = "teacher"
		end
		@user.update_attributes(:admin => val)
		redirect_to :back
	end
 	


 private

 def user_params
 	params.require(:user).permit!
 end
end
