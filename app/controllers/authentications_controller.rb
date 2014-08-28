class AuthenticationsController < ApplicationController

  def create
    respond_to do |format|
      if authenticate_user && set_user_session
        format.json { render json: @user, status: 201 }
      else
        format.json { render json: { error: 'Invalid username or password' }, status: 422 }
      end
    end
  end

  def destroy
    delete_user_session
    respond_to do |format|
      format.json { render json: 'OK', status: 200 }
    end
  end


  private

  def authenticate_user
    @user ||= begin
      auth = Authentication.new(params[:user])
      auth.login
    end
  end

  def delete_user_session
    session.delete(:user_id)
  end

  def set_user_session
    session[:user_id] = @user.id
  end

end