class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :json

  rescue_from(AuthorizationException, AuthenticationException) do |exception|
    respond_to do |format|
      format.json { render json: { error: exception.message }, status: 401 }
    end
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    respond_to do |format|
      format.json { render json: { error: exception.message }, status: 404 }
    end
  end

  private

  def require_authentication!
    raise AuthorizationException unless user_signed_in?
  end

  def user_signed_in?
    session[:user_id].present? && current_user.present?
  end

  def current_user
    @user ||= User.find(session.fetch(:user_id))
    
    rescue ActiveRecord::RecordNotFound
      raise AuthenticationException
  end

end