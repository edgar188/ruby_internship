admin_user = AdminUser.find_by_email(ENV['ADMIN_USER_EMAIL'])

if admin_user.nil?
  AdminUser.create(
    email: ENV['ADMIN_USER_EMAIL'],
    first_name: ENV['ADMIN_USER_FN'],
    last_name: ENV['ADMIN_USER_LN'],
    password: ENV['ADMIN_USER_PASS'],
    password_confirmation: ENV['ADMIN_USER_PASS']
  )
end