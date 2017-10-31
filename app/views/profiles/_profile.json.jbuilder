json.extract! profile, :id, :user_id, :first_name, :last_name, :image_data, :date_of_birth, :short_bio, :superpowers, :favourites, :created_at, :updated_at
json.url profile_url(profile, format: :json)
