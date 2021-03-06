class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:edit, :update, :destroy]
  before_action :check_purchased_edit, only: [:edit, :update]
  before_action :search_item, only: [:index, :search]

  def index
    @items = Item.order('created_at DESC')
  end

  def search
    @results = @i.result
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :description, :category_id, :condition_id, :burden_id, :area_id,
                                 :days_to_ship_id, :selling_price, :image).merge(user_id: current_user.id)
  end

  def check_user
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def check_purchased_edit
    redirect_to root_path if @item.purchase.present?
  end

  def set_params
    @item = Item.find(params[:id])
  end

  def search_item
    @i = Item.ransack(params[:q])
  end
end
