class LikesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    Like.create(user_id: current_user.id, item_id: @item.id)
    redirect_to root_path
  end

  def destroy
    @item = Item.find(params[:item_id])
    @like = @item.likes.find(params[:id])
    @like.destroy
    redirect_to root_path
  end
end
