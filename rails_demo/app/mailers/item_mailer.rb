class ItemMailer < ApplicationMailer

  def item_created
    @user = params[:user]
    @item = params[:item]

    mail(
      to: ENV['MAIL_TO'],
      cc: AdminUser.all.pluck(:email),
      subject: 'New item created'
    )
  end

end
