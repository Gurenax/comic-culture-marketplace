class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.references :seller, references: :users
      t.references :buyer, references: :users
      t.text :comment
      t.decimal :rating

      t.timestamps
    end

    # Seller ID references to User ID
    add_foreign_key :reviews, :users, column: :seller_id

    # Buyer ID references to User ID
    add_foreign_key :reviews, :users, column: :buyer_id
  end
end
