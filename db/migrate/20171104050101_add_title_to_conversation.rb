class AddTitleToConversation < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :title, :string
  end
end
