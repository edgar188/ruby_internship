Item.create!(
  # parrent: nil,
  category_id: 1,
  owner_type: Admin.first.class.name,
  owner_id: Admin.first.id,
  title: 'X6',
  description: 'Very good car',
  price: 500,
  countity: 1,
  ratting: 5,
  state: 1,
  options: { mark: 'BMV', year: '2007' }
)