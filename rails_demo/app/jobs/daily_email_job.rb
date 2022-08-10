class DailyEmailJob < ApplicationJob
  queue_as :default

  def perform
    DailyMailer.send_daily_email.deliver_later
  end
end