class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id #ジャンルID
      t.string :name, null: false #商品名
      t.text :introduction, null: false #商品説明文
      t.integer :excluding_tax, null: false #税抜価格
      t.boolean :is_sales_status #販売ステータス
      t.timestamps
    end
  end
end
