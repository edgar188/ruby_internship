json.extract! @user, :id, :first_name, :last_name, :email, :role, :gender, :birth_date, :country, :phone
json.full_name @user.show_full_name