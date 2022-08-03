ActiveAdmin.register Category do
  permit_params :name, :parent_id, :owner, :options

  index do
    selectable_column
    id_column
    column :parent
    column :name
    column :owner
    column :options
    actions
  end

  show do |item|
    attributes_table do
      row :id
      row :parent
      row :name
      row :owner
      row :options
      row :created_at
    end
  end

  filter :parent
  filter :name
  filter :owner
  filter :options
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :parent
      f.input :name
      f.input :owner
    end

    f.actions
  end

end
