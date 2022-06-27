let send_message_btn = document.getElementById('send_message_btn');
let new_message_input = document.getElementById('new_message_input');

new_message_input.addEventListener('input', function () {
  send_message_btn.className = 'd-none';

  if (new_message_input.value &&
    new_message_input.value.length >= 0 &&
    new_message_input.value.trim().length >= 0) {
    send_message_btn.className = 'btn btn-primary';
  } else {
    send_message_btn.className = 'd-none';
  }
});

$(function () {
  $('#new_message').on('ajax:success', function () {
    $(this).find('input[type="text"]').val('');
  });
});