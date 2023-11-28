class Public::OrdersController < ApplicationController
  before_action :set_customer
    def new
        @order = Order.new  
        @customer = current_customer
        @cart_items = current_customer.cart_items
    end 
    
    def confirm
      #binding.pry #デバッグ用 Gem である「pry-byebug」を用いて支払い方法のデータが@order に格納されているかを確認する
      if params[:order][:address_method] == "mine"
        # 自分の住所
        @order = Order.new(order_params)
        @order.shopping_postal_code = @customer.postal_code
        @order.shopping_address = @customer.address
        @order.shopping_name = @customer.first_name + @customer.last_name
      elsif params[:order][:address_method] == "other"
        # 入力したお届け先
        @order = Order.new(order_params)
      end
      
      @cart_items = current_customer.cart_items
      
    end

    
    def thanks
    end 
    
    def create
        @order = Order.new(order_params)
        @cart_items = current_customer.cart_items
        @customer = current_customer
        @order.customer_id = @customer.id
        if @order.save!
          #pry-byebug
          @cart_items.each do |cart_item|
            @order_product = OrderedProduct.new
            @order_product.item_id = cart_item.item_id
            @order_product.order_id = @order.id
            @order_product.tax_included = cart_item.subtotal_with_tax
            @order_product.amount = cart_item.amount
            @order_product.save!
          end
        end   
        
        @cart_items.destroy_all
        redirect_to orders_thanks_path
    end 
    
    def index
        @orders = current_customer.orders

    end 
    
    def show
      @order = Order.find(params[:id])
     
    end
    
    private
    def order_params
      params.require(:order).permit(:payment_method, :address_method, :address_id, :shopping_postal_code, :shopping_address, :shopping_name, :postage, :billing_amount, :status)
    end
    
    def set_customer
      @customer = current_customer
    end

end
