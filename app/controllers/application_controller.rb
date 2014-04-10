class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
   before_action :check_user

  private
  def check_user
    if cookies[:user_id]
      @session = Session.first(:user_id => cookies[:user_id])
      if @session # if we recognise the session, load user
        @current_user = User.first(:id => cookies[:user_id])
      else
        cookies[:user_id] = nil # old authentication
      end
    end
  end
end
