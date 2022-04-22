window.onload = function () {
  let option_add = document.getElementById('option_add');
  let options_list = document.getElementById('options_list');
  let options_count = 1;

  function counter_increment() {
    options_count++;

    if (options_count == 5) {
      option_add.className = 'd-none';
    }
  }

  option_add.onclick = function () {
    add_option();
    counter_increment();
  };

  function add_option() {
    let code_block = `<input class="form-control mb-2" placeholder="Option ${
        options_count + 1}" type="text" name = "options[]"></input> `;
    options_list.innerHTML += code_block;
  }
};
