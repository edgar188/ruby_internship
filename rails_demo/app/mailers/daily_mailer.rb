class DailyMailer < ApplicationMailer

  def send_daily_email
    @users_count = User.with_previous_day.count
    @items_count = Item.with_previous_day.count

    mail(
      to: ENV['MAIL_TO'],
      cc: AdminUser.all.pluck(:email),
      subject: 'RailsDemo, Daily report'
    )
  end
end