window.onload = function () {
  let items_table = document.getElementById('items_table');
  let items_table_body = document.getElementById('items_table_body');
  let items_count = document.getElementById('items_count');
  let items_search = document.getElementById('items_search');

  function render_items(data) {
    let items = data['result'];
    let items_count_new = items.length;

    // Show items count
    if (items_count_new < 1) {
      items_table.className = 'd-none';
      items_count.textContent = 'NO RESULT';
    } else {
      items_count.textContent = `Total ${items_count_new} items`;
      items_table.className = 'table table-striped ml-8';
    }

    // Hide elements
    for (let i = 0; i < items_table_body.childNodes.length; i++) {
      items_table_body.childNodes[i].className = 'd-none';
    }

    // Show searched items
    for (let i = 0; i < items_count_new; i++) {
      let item = items[i];
      let row = items_table.insertRow(1);
      row.className = 'link';
      row.setAttribute = 'gag';
      let title = row.insertCell(0);
      let price = row.insertCell(1);
      let count = row.insertCell(2);
      let date_modified = row.insertCell(3);
      title.innerHTML = `<td><a href="items/${item.id}"> ${item.title} </a> </td> `;
      price.innerHTML = `<td>$ ${item.price}</td>`;
      count.innerHTML = `<td>${item.countity}</td>`;
      date_modified.innerHTML = `<td>${item.updated_at.split('T')[0]}</td>`;
    }
  }

  if (items_search) {
    let timeout = null;

    items_search.addEventListener('keyup', function (event) {
      clearTimeout(timeout);

      timeout = setTimeout(function () {
        axiosGET('items/search?query=' + event.target.value)
          .then((res) => render_items(res['data']))
          .catch((error) => alert(error.message));
      }, 300);
    });
  }
};