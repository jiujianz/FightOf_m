class HomeController < ApplicationController
  before_action :logged_in_user

  def index
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "ログインして下さい"
      redirect_to login_url
    end
  end

end
