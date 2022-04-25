Item.create!(
  category_id: 105,
  owner_type: User.first,
  owner: User.first,
  title: 'X7',
  description: 'Very good car',
  price: 500,
  countity: 1,
  ratting: 5,
  state: 1,
  options: { mark: 'BMV', year: '2007' }
)