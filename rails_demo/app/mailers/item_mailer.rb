class ItemMailer < ApplicationMailer

  def item_created
    @user = params[:user]
    @item = params[:item]
    
    mail(
      from: 'vahe_2@example.com',
      to: 'sedrakyanvahe5@gmail.com', 
      cc: Admin.all.pluck(:email), 
      bcc: 'gago@mailinator.com', 
      subject: 'New item created'
    )
  end

end
