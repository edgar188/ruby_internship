let link_input = document.getElementById('resource_type_link');
let document_input = document.getElementById('resource_type_document');
let document_radio = document.getElementById('document_radio');
let link_radio = document.getElementById('link_radio');
let current_resource_type = document.getElementById('resource_type');

// Toggle selected type classes
function toggle_class(radio) {
  if (radio == 'link') {
    link_input.className = 'form-group row mb-2';
    document_input.className = 'd-none';
  } else if (radio == 'document') {
    link_input.className = 'd-none';
    document_input.className = 'form-group row mb-2';
  }
}

link_radio.addEventListener('click', function () {
  toggle_class(link_radio.value);
});

document_radio.addEventListener('click', function () {
  toggle_class(document_radio.value);
});

if (current_resource_type.dataset.current_radio_value) {
  toggle_class(current_resource_type.dataset.current_radio_value);
}
