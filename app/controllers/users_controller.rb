class UsersController < ApplicationController
  # skip_before_action :authenticate_user, only: [:new, :create]
  # before_action :redirect_if_authenticated, only: [:new, :create] 


  def index
   app_response(message: 'All data', status: :ok, data: User.all)
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      # SendWelcomeEmailJob.set(wait: 10.second).perform_later(user)
      redirect_to root_path, flash: { success: 'Registration successfully' }
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
