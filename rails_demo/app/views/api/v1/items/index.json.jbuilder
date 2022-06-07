json.array! @items[:result] do |item|
  json.extract! item, :id, :category_id, :owner_type, :owner_id, :title, :description, :price, :countity, :rating, :state, :options
end