unless @is_admin
  json.extract! @user, :id, :first_name, :last_name, :email, :role, :gender, :birth_date, :country, :phone
  json.full_name @logged_in.show_full_name
  json.is_admin @is_admin

  json.friends @friends do |friend|
    json.extract! friend, :id
    json.full_name friend.show_full_name
  end

  json.pending_requests @pending_requests do |pending_request|
    json.extract! pending_request, :id
    json.full_name pending_request.show_full_name
  end

  json.received_requests @received_requests do |received_request|
    json.extract! received_request, :id
    json.full_name received_request.show_full_name
  end
end

json.extract! @logged_in, :id, :first_name, :last_name, :email
json.full_name @logged_in.show_full_name
json.is_admin @is_admin