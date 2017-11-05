class AddLatitudeAndLongitudeToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :latitude, :decimal
    add_column :addresses, :longitude, :decimal
  end
end
