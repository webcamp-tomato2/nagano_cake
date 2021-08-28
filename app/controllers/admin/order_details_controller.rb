class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @making_status = params[:order_detail][:making_status].to_i
    @order_detail.update(making_status: @making_status)
    @order = @order_detail.order
    @order_details = OrderDetail.all
      if @making_status == 2
        @order_detail.order.update(status: 2)
      elsif @order.order_details.count == @order.order_details.where(making_status: 3).count
        @order_detail.order.update(status: 3)
      end
    redirect_to admin_order_path(@order_detail.order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
