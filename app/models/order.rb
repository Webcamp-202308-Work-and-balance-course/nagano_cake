class Order < ApplicationRecord
    enum payment_method: { credit_card: 0, transfer: 1 } #支払い方法
    enum address_method: { mine: 0, other: 1 } #お届け先住所
    
    belongs_to :customer
    has_many :order_items
    
    enum status: {
     waiting_payment: 0, #入金待ち
     payment_confirmation: 1, #入金確認
     in_production: 2, #製作中
     preparing_to_ship: 3, #発送準備中
     sent: 4 #発送済み
  }
end
