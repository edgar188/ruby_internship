require 'rails_helper'

describe Item, type: :model do
  before(:all) do
    Category.skip_callback(:validation, :before, :set_owner)
    Item.skip_callback(:validation, :before, :set_owner, :set_default_view)
    Item.skip_callback(:create, :after, :send_mail)
  end

  before do
    @user = User.create(
      email: ENV['RSPEC_USER_EMAIL'],
      first_name: ENV['RSPEC_USER_FN'],
      last_name: ENV['RSPEC_USER_LN'],
      password: ENV['RSPEC_USER_PASS'],
      password_confirmation: ENV['RSPEC_USER_PASS'],
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
      options: {"Year": "2009", "Location": "Yerevan"}
    )
  end

  context 'Item' do
    it 'should be equal to last record' do
      expect(Item.last.id).to eq @item.id
    end

    it 'is not valid when negative price' do
      @item.update(price: -100)
      expect(@item).to_not be_valid
    end

    it 'is not valid when negative countity' do
      @item.update(countity: -1)
      expect(@item).to_not be_valid
    end

    it 'is not valid without a category' do
      @item.update(category_id: nil)
      expect(@item).to_not be_valid
    end

    it 'is not valid without a title' do
      @item.update(title: nil)
      expect(@item).to_not be_valid
    end

    it 'is not valid without valid state' do
      @item.update(state: :speedily)
      expect(@item).to be_valid
    end

    it 'is not valid without a options' do
      @item.update(options: nil)
      expect(@item).to_not be_valid
    end

    it 'removes a record from the database' do
      expect { @item.destroy }.to change { Item.count }.by(-1)
    end
  end

  context 'Item resources' do
    it 'count should be equal 3' do
      file1 = Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/files/test1.xls"), 'application/xls')
      file2 = Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/files/test2.csv"), 'text/csv')

      @item.item_resources.create([
        { name: 'res1', resource_type: 'link', url: 'https://github.com/' },
        { name: 'res2', resource_type: 'document', file: file1 },
        { name: 'res3', resource_type: 'document', file: file2 }
      ])

      expect(@item.item_resources.count).to eq 3
    end

    it 'should be invalid' do
      file3 = Rack::Test::UploadedFile.new(File.open("#{Rails.root}/spec/fixtures/files/test3.png"), 'image/png')

      @item.item_resources.create([
        { name: 'res4', resource_type: 'document', file: file3 }
      ])

      expect(@item.item_resources.last).to_not be_valid
    end
  end
end