class Public::CustomersController < ApplicationController
    def show
        #@public = Public.find(params[:id])  
        @customer = Customer.find(current_customer.id)
    end 
    
    
  private
    def public_params
        params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number)  
    end    
    
end
