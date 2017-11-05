class AddDefaultValueToWeight < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :weight, :decimal, default: 0.0
  end
end
