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
end
