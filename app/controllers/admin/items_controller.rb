class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def new
    @item = Item.new
    @genre = Genre.all
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @genre = Genre.all
      render :new
    end
  end


  def index
    @items = Item.all
  end


  def edit
  end


  def show
  end


  def update
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre, :price, :is_active)
  end

end
