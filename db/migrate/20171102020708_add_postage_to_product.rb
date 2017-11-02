class AddPostageToProduct < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :postage, :string
  end
end
