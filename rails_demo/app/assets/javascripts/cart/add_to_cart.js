items_counter = document.getElementById('items_counter');

document.querySelectorAll('.add_to_cart_btn').forEach(item => {
  item.addEventListener('click', event => {
    items_counter.childNodes[0].data ++
  })
})