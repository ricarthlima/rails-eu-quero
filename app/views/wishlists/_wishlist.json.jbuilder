json.extract! wishlist, :id, :user_id, :nome, :desc, :link, :created_at, :updated_at
json.url wishlist_url(wishlist, format: :json)
