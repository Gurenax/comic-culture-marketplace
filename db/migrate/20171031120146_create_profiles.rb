# Migration file for Profile scaffold
# rubocop:disable MethodLength
class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :image_data
      t.date :date_of_birth
      t.text :short_bio
      t.string :superpowers
      t.string :favourites

      t.timestamps
    end
  end
end
