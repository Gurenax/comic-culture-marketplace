class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :buyer, references: :users
      t.string :charge_identifier

      t.timestamps
    end
    # Buyer ID references to User ID
    add_foreign_key :orders, :users, column: :buyer_id
  end
end
