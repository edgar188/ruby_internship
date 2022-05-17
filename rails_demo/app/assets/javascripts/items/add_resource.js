let url_input = document.getElementById('resource_type_url');
let document_input = document.getElementById('resource_type_document');
let document_radio = document.getElementById('document_radio');
let url_radio = document.getElementById('url_radio');
let current_resource_type = document.getElementById('resource_type');

console.log(current_resource_type.dataset.current_radio_value);
// alert(current_resource_type.dataset.current_radio_value);

// Toggle selected type classes
function toggle_class(radio) {
  if (radio.value == 'url') {
    url_input.className = 'form-group row mb-2';
    document_input.className = 'd-none';
  } else if (radio.value == 'document'){
    url_input.className = 'd-none';
    document_input.className = 'form-group row mb-2';
  }
}

// toggle_class(current_resource_type.dataset.current_radio_value)
toggle_class('url')


url_radio.addEventListener('click', function () {
  toggle_class(url_radio)
});

document_radio.addEventListener('click', function () {
  toggle_class(document_radio)
});

// // Select resource type
// for (let i = 0; i < resource_type_radio_btns.length; i++) {
//   console.log(resource_type_radio_btns[i]);
//   toggle_class(resource_type_radio_btns[i])

//   // resource_type_radio_btns[i].addEventListener('click', function () {
//   //   toggle_class(resource_type_radio_btns[i])
//   // });
// }