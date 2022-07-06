require 'rails_helper'

describe Category, type: :model do
  before(:all){ Category.skip_callback(:validation, :before, :set_owner) }

  before do
    @category = Category.create(
      parent_id: nil,
      name: 'CAT TEST',
      owner: {'id': 1, 'type': 'User', 'full_name': 'Vahe Sedrakyan'},
      options: ['Option 1']
    )
  end

  context 'Category' do
    it 'should be equal to last record' do
      expect(Category.last.id).to eq @category.id
    end

    it 'should be invalid without valid name' do
      @category.update(name: '1')
      expect(@category).not_to be_valid
    end

    it 'removes a record from the database' do
      expect { @category.destroy }.to change { Category.count }.by(-1)
    end
  end
end