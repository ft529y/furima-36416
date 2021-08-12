class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :check_purchase_user, only: :index


  def index
    @item = Item.find(params[:item_id])
  end


  private
  def check_purchase_user
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
