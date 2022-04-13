ActiveAdmin.register Admin do
  permit_params :email, :first_name, :last_name, :show_full_name, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column "Full name", :show_full_name
    # column :first_name
    # column :last_name
    # column :current_sign_in_at
    # column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :first_name.to_s + 'gago'
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