ActiveAdmin.register Item do
  permit_params :category_id, :owner_type, :owner_id, :title, :description, 
                :price, :countity, :state, :options
  
  index do
    selectable_column
    id_column
    column :category_id 
    column :owner_type
    column :owner_id 
    column :title 
    column :description 
    column :price
    column :countity
    column :state 
    column :options
    actions
  end

  show do |item|
    attributes_table do
      row :id
      row :category_id 
      row :owner_type
      row :owner_id 
      row :title 
      row :description 
      row :price
      row :countity
      row :state 
      row :options
      row :created_at
    end
  end

  filter :category_id 
  filter :owner_type
  filter :owner_id 
  filter :title 
  filter :description 
  filter :price
  filter :countity
  filter :state 
  filter :options
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :category_id 
      f.input :owner_type
      f.input :owner_id 
      f.input :title 
      f.input :description 
      f.input :price
      f.input :countity
      f.input :state 
      f.input :options
    end
    
    f.actions
  end

end