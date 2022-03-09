const input_val = document.getElementById('input_val');

// ADD NEW ITEM INTO LOCAL STORAGE
function add_item() {
  
  if (input_val.value.trim() != 0) {
    let local_items = JSON.parse(localStorage.getItem('local_item'));

    if (local_items === null) {
      task_list = [];
    } else {
      task_list = local_items;
    }

    task_list.push(input_val.value);
    localStorage.setItem('local_item', JSON.stringify(task_list));
    input_val.value = '';
  }

  show_item();
}

// GET DATA FROM LOCAL STORAGE AND SHOW
function show_item() {
  let local_items = JSON.parse(localStorage.getItem('local_item'));

  if (local_items === null) {
    task_list = [];
  } else {
    task_list = local_items;
  }

  // CREATE NEW HTML li TAG
  let html = '';
  let item_show = document.querySelector('#todo_list');

  task_list.forEach((data, index) => {
    html += `
    <li class="list-group-item d-flex justify-content-between align-items-center border-start-0 border-top-0 border-end-0 border-bottom rounded-0 mb-2">
       <div class="d-flex align-items-center text-break">${data}</div>
       <button class="btn btn-outline-secondary bg-danger text-white rounded-circle" type="button delete_task p-1" onClick="delete_item(${index})">X</button>
     </li>`;
  });

  item_show.innerHTML = html;
}

show_item();

// DELETE 1 ITEM
function delete_item(index) {
  task_list.splice(index, 1);
  localStorage.setItem('local_item', JSON.stringify(task_list));
  show_item();
}

// DELETE ALL ITEMS
function clear_all_tasks() {
  localStorage.clear();
  show_item();
}
