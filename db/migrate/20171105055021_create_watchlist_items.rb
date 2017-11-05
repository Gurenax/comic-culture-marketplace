class CreateWatchlistItems < ActiveRecord::Migration[5.1]
  def change
    create_table :watchlist_items do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :watchlist, foreign_key: true

      t.timestamps
    end
  end
end
