class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!

    def new
        @order = Order.new
    end

    def confirm
        @order = Order.new
        @cart_items = current_customer.cart_items
        #Orderモデルに乗せてpayment_methodを持ってくる
        @order.payment_method = params[:order][:payment_method]
        #会員との紐付け
        @order.customer_id = current_customer.id
        #配送料は800円。決まっているものはコントローラで定義。
        @order.shipping_cost = 800
        @total = @cart_items.inject(0) { |sum, item| sum + item.sub_price }
        if params[:order][:address_option] == "0"
            #newページから送られてきた情報をOrderモデルのカラムを使って置き換える
            @order.postal_code = current_customer.postal_code
            @order.address = current_customer.address
            @order.name = current_customer.full_name
        elsif params[:order][:address_option] == "1"
            #モデルに乗ってやってきた住所（order_address_id）を数値で取得してaddressモデルから登録済みの住所を引っ張ってくる
            @sta = params[:order][:order_address_id].to_i
            @order_address_id = Address.find(@sta)
            #findで見つけてきた住所Orderモデルのカラムに置き換える
            @order.postal_code = @order_address_id.postal_code
            @order.address = @order_address_id.address
            @order.name = @order_address_id.name
        elsif params[:order][:address_option] == "2"
            @order.postal_code = params[:order][:postal_code]
            @order.address = params[:order][:order_address]
            @order.name = params[:order][:name]
        else
            render :new
            flash.now[:notice] = "住所を入力してください"
        end
    end


    def create
        @order = Order.new(order_params)
        @order.shipping_cost = 800
        @cart_items = current_customer.cart_items
        @order.customer_id = current_customer.id

        #注文（order）を保存したときにcart_itemを空にするために、
        #cart_itemの情報をorder_detailに移す
        if @order.save
            #cart_itemの中身を一つずつ取り出し、order_detailの対応するカラムに移していく
            #書き方はseed.rbの書き方
           @cart_items.each do |cart_item|
             OrderDetail.create!(
               amount: cart_item.amount,
               item_id: cart_item.item_id,
               order_id: @order.id,
               price: cart_item.add_tax_price
               )
           end

           #ここまででcart_itemの中身は全部移動できたから削除する
           @cart_items.destroy_all
           redirect_to orders_thanx_path
        else
           render :index
        end

    end


    def thanx
    end


    def index
        @orders = current_customer.orders.order(created_at: "DESC")
    end


    def show

        @order = Order.find(params[:id])
        @order.shipping_cost = 800
        @order_details = @order.order_details
    end


    private
   
    def order_params
        params.require(:order).permit(:postal_code, :payment_method, :address, :total_payment, :name)
    end
end
