# Preview all emails at http://localhost:3000/rails/mailers/item_mailer
class ItemMailerPreview < ActionMailer::Preview

  def item_created
    ItemMailer.with(user: User.first, item: Item.first).item_created
  end

end