# Migration file for Product scaffold
# rubocop:disable MethodLength
# rubocop:disable AbcSize
class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :seller, references: :users
      t.string :name
      t.decimal :price
      t.text :description
      t.string :condition # (0=comic books, 1=toys, 2=costumes, 3=clothing/apparel)
      t.string :status    # (0=brand new, 1=mint, 2=good, 3=fair, 4=poor)
      t.string :category  # (0=available, 1=sold)
      t.string :manufacturer
      t.string :publisher
      t.date :publish_date
      t.string :author
      t.string :illustrator
      t.string :isbn_10
      t.string :isbn_13
      t.string :dimensions
      t.decimal :weight
      t.string :keywords

      t.timestamps
    end

    # Seller ID references to User ID
    add_foreign_key :products, :users, column: :seller_id
    # Ensure that product names are unique for each seller
    add_index :products, %i[seller_id name], unique: true
  end
end
