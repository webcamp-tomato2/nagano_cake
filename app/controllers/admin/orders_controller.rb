class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @orders = Order.all
    end


    def show
        @order = Order.find(params[:id])
        @order.shipping_cost = 800
        @order_details = OrderDetail.all
    end


    def update
        order = Order.find(params[:id])
        status = params[:order][:status].to_i
        order.update(status: status)
        redirect_to admin_order_path(order)
    end

end
