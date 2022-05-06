ActiveAdmin.register User do
  permit_params :role, :first_name, :last_name, :email, :gender, :birth_date, :country, :phone
  menu label:  'Users'
  
  index do
    selectable_column
    id_column
    column :role
    column :first_name
    column :last_name
    column :email
    column :gender
    column :birth_date
    column :country
    column :phone
    column :created_at
    actions
  end

  show do |item|
    attributes_table do
      row :id
      row :role
      row :first_name
      row :last_name
      row :email
      row :gender
      row :birth_date
      row :country
      row :phone
      row :created_at
    end
  end

  filter :role
  filter :first_name
  filter :last_name
  filter :email
  filter :gender
  filter :birth_date
  filter :country
  filter :phone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :role
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :gender
      f.input :birth_date
      f.input :country, as: :select, collection: (['No select', 'Armenia', 'Russia', 'USA', 'UK'])
      f.input :phone
    end
    
    f.actions
  end
end
