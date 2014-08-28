class ListsController < ApplicationController

  before_action :set_list, only: [:show, :edit, :update, :destroy]
  prepend_before_action :require_authentication!

  def index
    respond_to do |format|
      format.json { render json: current_user.lists }
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @list }
    end
  end

  def create
    @list = current_user.lists.build(list_params)

    respond_to do |format|
      if @list.save
        format.json { render json: @list, status: :created }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update(list_params)
        format.json { render :show, status: :ok, location: @list }
      else
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

    def set_list
      @list ||= current_user.lists.find(params[:id])
    end

    def list_params
      params.require(:list).permit(:name, :sort_order)
    end
end
