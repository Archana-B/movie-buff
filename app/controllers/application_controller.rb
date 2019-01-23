class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

private

  def require_sign_in
   unless current_user
    session[:intended_url] = request.url
    redirect_to signin_path, notice: "Please sign in!"
   end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def current_user?(user)
    current_user == user
  end

  helper_method :current_user?

  def require_admin
    unless current_user_admin?
      redirect_to root_path, notice: "You are not authorized to perform this action!!!"
    end
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

end
