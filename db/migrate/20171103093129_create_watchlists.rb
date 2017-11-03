class CreateWatchlists < ActiveRecord::Migration[5.1]
  def change
    create_table :watchlists do |t|
      t.belongs_to :buyer, index: true, foreign_key: { to_table: :users }
      t.belongs_to :product, index: true, foreign_key: true

      t.timestamps
    end

    add_index :watchlists, [:buyer_id, :product_id], unique: true
  end
end
