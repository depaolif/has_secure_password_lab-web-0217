class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save
    if user.authenticate(params[:user][:password]) && params[:user][:password] == params[:user][:password_confirmation]
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
