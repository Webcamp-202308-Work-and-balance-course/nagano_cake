class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer, null: false #会員ID
      t.integer :postage, null: false #送料
      t.integer :billing_amount, null: false #請求金額
      t.string :shopping_postal_code, null: false #配送先郵便番号
      t.string :shopping_address, null: false #配送先住所
      t.string :shopping_name, null: false #配送先宛名
      t.integer :payment_method, null: false #支払い方法
      t.integer :status, null: false #ステータス
      t.timestamps
    end
  end
end
