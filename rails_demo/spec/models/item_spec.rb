require 'rails_helper'

describe Item, type: :model do
  before(:all) do
    Category.skip_callback(:validation, :before, :set_owner)
    Item.skip_callback(:validation, :before, :set_owner, :set_default_view)
    Item.skip_callback(:create, :after, :send_mail)
  end

  before do
    @user = User.create!(
      email: 'test@mail.com',
      first_name: 'FNAME',
      last_name: 'LNAME',
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
      options: {"Year": "2009", "Location": "Yerevan"}
    )
  end

  context 'Item' do
    it 'should be equal to last record' do
      expect(Item.last.id).to eq @item.id
    end

    it 'should be invalid' do
      @item.update(price: -1)
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