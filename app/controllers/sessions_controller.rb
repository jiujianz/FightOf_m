class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_path
      else
      message  = "Account not activated. "
      message += "Check your email for the activation link."
      flash[:warning] = message
      render 'new'
      end
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end