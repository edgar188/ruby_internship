unless @is_admin
  json.extract! @user, :id, :first_name, :last_name, :email, :role, :gender, :birth_date, :country, :phone
end

json.extract! @logged_in, :id, :first_name, :last_name, :email
json.full_name @logged_in.show_full_name
json.is_admin @is_admin