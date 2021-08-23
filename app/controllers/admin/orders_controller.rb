class Admin::OrdersController < ApplicationController
    before_action :authenticate_admin!

    def index
        @orders = Order.all
    end


    def show
        @order = Order.find(params[:id])
        @total = @order_details.inject(0) { |sum, item| sum + item.sub_price }
        
    end


    def update
        order = Order.find(params[:id])
        status = params[:order][:status].to_i
        order.update(status: status)
        redirect_to admin_order_path(order)
    end

end
