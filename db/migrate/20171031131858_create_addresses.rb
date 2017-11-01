# Migration file for the Address model
# rubocop:disable MethodLength
class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :house_number
      t.string :street_name
      t.string :town_suburb
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country_code

      t.timestamps
    end
  end
end
