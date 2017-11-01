# Migration file for Billing Address and Shipping Address
class AddAddressesToProfile < ActiveRecord::Migration[5.1]
  def change
    change_table :profiles do |t|
      t.integer :billing_address_id
      t.integer :shipping_address_id
    end
  end
end
