class ApplicationController < ActionController::Base
helper_method :current_user

private

  def current_user
    @current_user ||= User.find_by(uid: session[:uid])
  end

  def current_user=(user)
    session[:uid] = user.uid
    session[:name] = user.name
  end

  def user_signed_in?
    !!current_user
  end

  def authenticate_user
    unless user_signed_in?
      redirect_to 'localhost:3000/login', notice: "Please log in first"
    end

  end
end
