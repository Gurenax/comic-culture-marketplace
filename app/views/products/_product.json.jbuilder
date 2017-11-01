json.extract! product, :id, :user_id, :name, :price, :description, :condition, :status, :category, :manufacturer, :publisher, :publish_date, :author, :illustrator, :isbn_10, :isbn_13, :dimensions, :weight, :keywords, :created_at, :updated_at
json.url product_url(product, format: :json)
