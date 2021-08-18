class LikesController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create, :destroy]
  before_action :set_item_params, only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, item_id: @item.id)
    redirect_to root_path
  end

  def destroy
    @like = @item.likes.find(params[:id])
    @like.destroy
    redirect_to root_path
  end
end

private

def set_item_params
  @item = Item.find(params[:item_id])
end
