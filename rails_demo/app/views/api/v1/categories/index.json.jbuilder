json.array! @categories do |category|
  json.extract! category, :id, :parent_id, :name, :owner, :options
end