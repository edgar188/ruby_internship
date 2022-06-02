if @is_admin
  json.full_name @logged_in.show_full_name
  json.extract! @logged_in, 
    :id, 
    :first_name, 
    :last_name, 
    :email
  json.is_admin @is_admin
else
  json.full_name @logged_in.show_full_name
  json.extract! @user, 
  :id,
  :first_name, 
  :last_name, 
  :email, 
  :role, 
  :gender, 
  :birth_date, 
  :country, 
  :phone
  json.is_admin @is_admin
end