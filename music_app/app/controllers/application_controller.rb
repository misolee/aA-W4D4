class ApplicationController < ActionController::Base
  helper_method :current_user, :current_user_id

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end

  def require_logout
    redirect_to user_url(current_user) unless logged_out?
  end

  def logged_in?
    !!current_user
  end

  def logged_out?
    !current_user
  end

  def current_user_id
    new_array = []
    email = current_user.email.split("")
    email.each do |letter|
      if letter == "@"
        break
      else
        new_array << letter
      end
    end
    new_array.join("")
  end

  def logout
    session[:session_token] = nil
    current_user.reset_session_token! if current_user
    @current_user
  end
end
