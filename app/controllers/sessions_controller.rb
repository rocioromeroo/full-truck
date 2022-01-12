class SessionsController < ApplicationController
  def new
  @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(users_params)
  end

  private

  def user_params
    params.require(:user).permit(:nombre, :apellido)
  end
end
