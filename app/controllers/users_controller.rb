class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]
  prepend_before_action :require_authentication!

  def show
    respond_to do |format|
      format.json { render json: @user }
    end
  end

  def update
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user ||= current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
