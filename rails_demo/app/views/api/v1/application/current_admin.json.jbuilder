json.extract! @logged_in, :id, :first_name, :last_name, :email
json.full_name @logged_in.show_full_name
json.is_admin @is_admin