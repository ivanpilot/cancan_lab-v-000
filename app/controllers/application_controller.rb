class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authentication_required
    if !is_logged_in?
      # redirect_to '/'
    end
  end

  def is_logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by(id:session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

end
