class ApplicationController < ActionController::Base
  def user_signed_in?
    !!current_user
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to login_url, notice: "Please log in first"
    end
  end
end
