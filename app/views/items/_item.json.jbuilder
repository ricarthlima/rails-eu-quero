json.extract! item, :id, :nome, :link_img, :link_prod, :preco, :desc, :wishlevel, :ativo, :created_at, :updated_at
json.url item_url(item, format: :json)
