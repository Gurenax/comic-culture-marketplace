json.extract! message, :id, :user_id, :conversation_id, :body, :created_at, :updated_at
json.url message_url(message, format: :json)
