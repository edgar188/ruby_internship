ActiveAdmin.register Admin do
  permit_params :email, :first_name, :last_name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column "Full name", :show_full_name
    column :created_at
    actions
  end

  show do |item|
    attributes_table do
      row :id
      row :email
      row :first_name
      row :last_name
      row :show_full_name
      row :created_at
    end
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :show_full_name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :first_name
      f.input :last_name
      f.input :password
      f.input :password_confirmation
    end

    f.actions
  end

end