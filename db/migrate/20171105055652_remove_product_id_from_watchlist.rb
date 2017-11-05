class RemoveProductIdFromWatchlist < ActiveRecord::Migration[5.1]
  def change
    remove_column :watchlists, :product_id
  end
end
