ActiveAdmin.register Category do
  permit_params :parrent, :name, :owner, :options
  
  index do
    selectable_column
    id_column
    column :parrent
    column :name
    column :owner
    column :options
    actions
  end

  show do |item|
    attributes_table do
      row :id
      row :parrent
      row :name
      row :owner
      row :options
      row :created_at
    end
  end

  filter :parrent
  filter :name
  filter :owner
  filter :options
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :parrent
      f.input :name
      f.input :owner
      f.input :options
    end
    
    f.actions
  end

end