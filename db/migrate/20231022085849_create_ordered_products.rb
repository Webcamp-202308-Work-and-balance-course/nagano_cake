class CreateOrderedProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :ordered_products do |t|
      t.integer :item_id, null: false #商品ID
      t.integer :order_id, null:false #注文ID
      t.integer :tax_included, null:false #税込価格
      t.integer :amount, null: false #個数
      t.integer :production_status, null:false, default: 1 #製作ステータス
      t.timestamps
    end
  end
end
