class SessionsController < ApplicationController

	def new
		if current_user.nil?
			@user = User.new
		else
			redirect_to user_path(current_user)
	end
end

  def create
    @user = User.confirm(login_params)
    if @user
      login(@user)
      flash[:notice] = "Successfully logged in."
      redirect_to @user
    else
    	flash[:error] = "Incorrect email or password"
      redirect_to login_path
    end
  end

  def destroy
  	logout
  	flash[:notice] = "Successfully logged out."
  	redirect_to root_path
  end
end

private

def login_params
	params.require(:user).permit(:email, :password)
end
