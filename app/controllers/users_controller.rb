class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @items = Item.order('created_at DESC')
    @current_user_items = current_user.items
  end
end
