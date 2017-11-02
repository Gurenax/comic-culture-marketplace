class CreateJoinTableForUserAndProduct < ActiveRecord::Migration[5.1]
  def change
    create_table :product_views do |t|
      t.belongs_to :product, index: true, foreign_key: true
      t.belongs_to :buyer, index: true, foreign_key: { to_table: :users }
    end

    add_index :product_views, [:product_id, :buyer_id], unique: true
  end
end
