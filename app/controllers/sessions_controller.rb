class SessionsController < ApplicationController
  # before_action :logged_in?, only:[:create, :new]

  # def new
  # end

  # def create
  #   @user = User.new(user_params)
  #   if @user.save
  #     log_in @user
  #     params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  #     remember user
  #     flash[:success] = "Welcome to the Sample App!"
  #     redirect_to @user
  #   else
  #     render 'new'
  #   end
  # end
  
  # def destroy
  #   log_out if logged_in?
  #   redirect_to login_path
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :email, :password, :password_confirmation)
  # end



  skip_before_action :require_sign_in!, only: [:new, :create]
  before_action :set_user, only: [:create]

  def new
  end

  def create
    if @user.authenticate(session_params[:password])
      sign_in(@user)
      redirect_to root_path
    else
      flash.now[:danger] = t('.flash.invalid_password')
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end

  private

    def set_user
      @user = User.find_by!(email: session_params[:email])
    rescue
      flash.now[:danger] = t('.flash.invalid_mail')
      render action: 'new'
    end

    def session_params
      params.require(:session).permit(:email, :password)
    end


end