class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

  private
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticated
  	if current_user.nil?
  		flash[:error] = "You must be signed in to do that!"
  		redirect_to :root
  	end
  end

  def admin
  	if current_user.nil? || !current_user.admin
  		session[:source] = request.path
  		flash[:error] = "You must be signed in to do that!"
  		redirect_to :root
  	end
  end
end
