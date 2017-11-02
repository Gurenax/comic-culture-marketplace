class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.belongs_to :order, index: true, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
    # Ensure that orders and products are compoundly unique
    add_index :order_items, %i[order_id product_id], unique: true
  end
end
