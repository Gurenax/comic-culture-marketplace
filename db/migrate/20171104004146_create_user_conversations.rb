class CreateUserConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :user_conversations do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :conversation, foreign_key: true

      t.timestamps
    end
  end
end
