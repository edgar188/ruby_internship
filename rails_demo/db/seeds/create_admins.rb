Admin.create!(
  email: ENV['ADMIN_EMAIL'],
  first_name: ENV['ADMIN_FN'],
  last_name: ENV['ADMIN_LN'],
  password: ENV['ADMIN_PASS'],
  password_confirmation: ENV['ADMIN_PASS']
) 