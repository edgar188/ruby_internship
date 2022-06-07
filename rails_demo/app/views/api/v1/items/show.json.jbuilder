json.extract! @item, :id, :category_id, :owner_type, :owner_id, :title, :description, :price, :countity, :rating, :state, :options

if @item.item_resources.present?
  json.item_resources @item.item_resources do |item_resource|
    json.extract! item_resource, :id, :name, :resource_type
    if item_resource.link?
      json.link item_resource.url
    else
      json.document_id item_resource.file.id
      json.document_name item_resource.name
    end
  end
end