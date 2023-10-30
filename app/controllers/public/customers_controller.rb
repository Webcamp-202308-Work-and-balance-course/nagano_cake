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
        @customer.update(@customer_params)
        redirect_to customers_mypage_path(@customer.id)  
    end
    
  private
    def public_params
        params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)  
    end    
    
end
