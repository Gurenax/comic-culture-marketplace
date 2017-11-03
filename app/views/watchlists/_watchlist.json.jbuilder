json.extract! watchlist, :id, :user_id, :product_id, :created_at, :updated_at
json.url watchlist_url(watchlist, format: :json)
