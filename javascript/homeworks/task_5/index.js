const input_val = document.getElementById('input_val');

// ADD NEW ITEM INTO LOCAL STORAGE
function add_item() {
  if (input_val.value.trim() != 0) {
    let local_items = JSON.parse(localStorage.getItem('local_items'));

    if (local_items === null) {
      task_list = [];
    } else {
      task_list = local_items;
    }

    task_list.push(input_val.value);
    localStorage.setItem('local_items', JSON.stringify(task_list));
    input_val.value = '';
  }

  show_item();
}

// GET DATA FROM LOCAL STORAGE AND SHOW
function show_item() {
  let local_items = JSON.parse(localStorage.getItem('local_items'));

  if (local_items === null) {
    task_list = [];
  } else {
    task_list = local_items;
  }

  // CREATE NEW HTML li TAG
  let todo_list = document.getElementById('todo_list');
  let new_li = '';

  task_list.forEach((data, index) => {
    new_li += `
    <li class="list-group-item d-flex justify-content-between align-items-center border-start-0 border-top-0 border-end-0 border-bottom rounded-0 mb-2">
       <div class="d-flex align-items-center text-break">${data}</div>
       <button class="btn btn-outline-secondary bg-danger text-white rounded-circle" type="button delete_task p-1" onClick="delete_item(${index})">X</button>
     </li>`;
  });

  todo_list.innerHTML = new_li;
}

show_item();

// DELETE SINGLE ITEM
function delete_item(index) {
  task_list.splice(index, 1);
  localStorage.setItem('local_items', JSON.stringify(task_list));
  show_item();
}

// DELETE ALL ITEMS
function clear_all_items() {
  localStorage.clear();
  show_item();
}
