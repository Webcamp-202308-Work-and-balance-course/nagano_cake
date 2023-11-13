class Public::CartItemsController < ApplicationController
    def index
        @cart_items = current_customer.cart_items
    end 
    
 #   def create
  #    # 検索条件
   #   if current_customer.nil?
    #    flash.now[:alert] = "会員登録後注文が可能です。"
     #   redirect_to new_customer_registration_path
      #end
        
#      search = { item_id: params[:cart_item][:item_id], customer_id: current_customer.id }
 #     
  #    # 条件に一致するカート内のレコードを検索
   #   existing_cart = CartItem.find_by(search)
      
    #  if existing_cart.nil?
        # 新しいカートアイテムを作成
     #   @cart_item = CartItem.new(search)
      #else
       # @cart_item = existing_cart
#        @cart_item.amount += params[:cart_item][:amount].to_i
 #     end
      
      # 既存の場合
  #    if @cart_item.save
   #     redirect_to cart_items_path, notice: existing_cart.nil? ? "商品を追加しました。" : "商品の個数を変更しました。"
    #  else
     #   flash.now[:alert] = existing_cart.nil? ? "商品を追加できませんでした。" : "商品の個数を変更できませんでした。"
      #  render existing_cart.nil? ? :new : :edit
      #end
#    end



def create
  if current_customer.nil?
    # ログインしていない場合はログイン画面にリダイレクト
    
    redirect_to new_customer_session_path
    flash.now[:alert] = "ログインしてください。"
    return
  end

  @cart_item = CartItem.find_or_initialize_by(item_id: params[:cart_item][:item_id], customer_id: current_customer.id)
  @cart_item.amount ||= 0
  @cart_item.amount += params[:cart_item][:amount].to_i

  if @cart_item.save
    puts "カート内の商品一覧："
    current_customer.cart_items.each do |cart_item|
      puts "商品名：#{cart_item.item.name}"
    end
    
    if @cart_item.new_record?
      redirect_to cart_items_path, notice: "商品を追加しました。"
    else
      redirect_to cart_items_path, notice: "商品の個数を変更しました。"
    end
  else
    logger.error @cart_item.errors.full_messages.join(', ')
    flash.now[:alert] = "商品を追加または個数を変更できませんでした。"
    render @cart_item.new_record? ? :index : :edit
  end
end









 #   if @cart_item.new_record?
  #    redirect_to cart_items_path, notice: "商品を追加しました."
   # else
    #  redirect_to cart_items_path, notice: "商品の個数を変更しました."
 #   end
 # else
  #  flash.now[:alert] = "商品を追加または個数を変更できませんでした."
   # if @cart_item.new_record?
    #  render :index
#    else
 #     render :edit
  #  end
   # return  # ここでreturnしてアクションを終了する
#  end
#end





    def update
      @cart_item = CartItem.find(params[:id])
      new_amount = params[:cart_item][:amount].to_i
      @cart_item.update(amount: new_amount)
      redirect_to cart_items_path, notice: "数量を変更しました。"
    end
    
    def destroy
      @cart_item = CartItem.find_by(id: params[:id])
      if @cart_item
        @cart_item.destroy
        redirect_to cart_items_path, notice: "商品が削除されました。"
      else
        redirect_to cart_items_path, notice: "商品が見つかりませんでした。"
      end
    end
    
    def destroy_all
      @cart_items = current_customer.cart_items
      current_customer.cart_items.destroy_all
      redirect_to cart_items_path, notice: "カート内のすべての商品が削除されました。"
    end

        
private
 
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
    end
    
    

end
