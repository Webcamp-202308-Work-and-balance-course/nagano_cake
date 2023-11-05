class Public::CartItemsController < ApplicationController
    def index
        @cart_items = current_customer.cart_items
    end 
    
    def create
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.save  # 変数名が間違っていました。"@cart_item"ではなく"cart_item"です。
      redirect_to items_path
    end
    
    def update
      @cart_item = CartItem.find(params[:id])
      @cart_item.update(cart_item_params)
      redirect_to items_path
    end
        
        
private
 
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    end
    
    

end
