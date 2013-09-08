class ApplicationController < ActionController::Base
  
  protect_from_forgery
  helper_method :current_user

  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authenticated
    if current_user.nil? || current_user && current_user.fb_expired?
      reset_session
      respond_to do |format|
        format.html { redirect_to login_path }
        format.json { render json: {error: "Unauthorized"}, status: :unauthorized }
      end
    end
  end

  def admin
    if current_user.nil? || !current_user.admin
      session[:source] = request.path
      flash[:error] = "You must be signed in to do that!"
      redirect_to :root
    end
  end

  def fb_reconnect
    if current_user && current_user.oauth_expires_at < DateTime.now
      session[:source] = request.path
      reset_session
      flash[:error] = "Please sign in again."
      redirect_to :root
    end
  end
  
  def clean_url(url)
    url.gsub(/\/$/, "")
  end
end
