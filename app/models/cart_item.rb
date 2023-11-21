class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :customer
    
    
# 小計を求めるメソッド
    def subtotal
      item.with_tax_price * amount
    end
    
    def subtotal_with_tax
        subtotal * 1.08
    end 

end
