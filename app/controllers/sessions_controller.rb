class SessionsController < ApplicationController
  protect_from_forgery except: :create
  def create
    github_hash = request.env['omniauth.auth']
    @user = User.find_or_create_by(uid: github_hash['uid']) do |user|
      user.name = github_hash['info']['nickname']
      user.email = github_hash['info']['email']
    end
    self.current_user = @user
    redirect_to restaurants_url
  end
  def login
  end
  def logout
    reset_session
    redirect_to login_url
  end
end
