class ItemsController < ApplicationController
  before_action :move_to_signed_in?, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  private


  def move_to_signed_in?
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :burden_id, :area_id, :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end
end
