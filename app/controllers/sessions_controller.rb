class SessionsController < ApplicationController
  protect_from_forgery except: :create
  def create
  end
  def login
  end
  def logout
  end
end
