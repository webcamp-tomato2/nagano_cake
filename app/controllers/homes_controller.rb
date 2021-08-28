class HomesController < ApplicationController

  def top
    # 新着を表示
    @items = Item.order(created_at: :desc).limit(4)
    @item = Item.find_by(params[:id])
    @genres = Genre.all

  end

  def about
  end

end
