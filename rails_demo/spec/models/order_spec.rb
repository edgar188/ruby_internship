require 'rails_helper'

describe UserItem, type: :model do
  before(:all) do
    Category.skip_callback(:validation, :before, :set_owner)
    Item.skip_callback(:validation, :before, :set_owner, :set_default_view)
    Item.skip_callback(:create, :after, :send_mail)
    UserItem.skip_callback(:update, :after, :pay)
  end

  before do
    @user = User.create!(
      email: 'test@mail.com',
      first_name: 'FNAME',
      last_name: 'LNAME',
      balance: 200,
      password: '123456'
    )

    @category = Category.create(
      parent_id: nil, name: 'CAT TEST',
      owner: {'id': 1, 'type': 'User', 'full_name': 'Vahe Sedrakyan'},
      options: ['Option 1']
    )

    @item = Item.find_or_create_by(
      category_id: @category.id,
      owner: @user,
      title: 'ITEM TEST',
      price: 200,
      countity: 20,
      options: {"Year": "2009", "Location": "Yerevan"}
    )

    @user_item = @user.user_items.create(item: @item, ordered_at: nil)
  end

  context 'UserItem' do
    it 'should be equal to last record' do
      expect(UserItem.last.id).to eq @user_item.id
    end

    it 'Balance should be equal to 0 after order' do
      balance = @user.balance
      balance -= @user.user_items.total_price
      ordered_at = DateTime.now
      @user.update!(balance: balance)
      @user_item.update!(ordered_at: ordered_at)
      expect(@user.balance).to eq 0
      expect(@user_item.ordered_at).to be_an_instance_of(ActiveSupport::TimeWithZone)
    end
  end
end