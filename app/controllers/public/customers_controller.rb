class Public::CustomersController < ApplicationController
    def show
        #@public = Public.find(params[:id])  
        @customer = Customer.find(current_customer.id)
    end 
    
    def edit
        @customer = Customer.find(current_customer.id)
    end     
    
    def update
        #@customer = Customer.find(params[:id])
        @customer = Customer.find(current_customer.id)
        @customer.update(public_params)
        #@customer.update(params[:customer])
        redirect_to customers_mypage_path, notice: '会員情報が更新されました。'
    end
    
    def confirm
    end 
    
    def withdraw
        @customer = Customer.find(current_customer.id)
        @customer.update(is_active: false)
        reset_session
        flash[:notice] = "退会処理を実行いたしました"
        redirect_to new_customer_registration_path
    end 
    
  private
    def public_params
        params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)  
    end    
    
end
