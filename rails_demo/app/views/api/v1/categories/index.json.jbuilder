json.array! @categories[:result] do |category|
  json.extract! category, :id, :parent_id, :name, :owner, :options
end