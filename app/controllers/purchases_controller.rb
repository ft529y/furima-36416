class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :check_purchase_user, only: :index


  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index
    end
    
    
  end


  private
  def check_purchase_user
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchase_params
    params.require(:purchase_delivery).permit(:postal_code, :phone_number, :municipality, :address, :building_name, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
