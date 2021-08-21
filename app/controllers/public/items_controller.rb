class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @item = Item.find_by(params[:id])
  end

  def show
    @item = Item.find_by(params[:id])
    @cart_item = CartItem.new
  end


end
