function render_new_message(element, data) {
  if (data.id == null) {
    return;
  }

  let current_user_id = document.getElementById('message_data').getAttribute('data-current_user_id');
  let message_box_class_name = '';
  let message_text_class_name = '';
  let message_owner_name = '';

  if (data.additional_info.user_id == current_user_id) {
    message_box_class_name = 'chat-message-right';
    message_text_class_name = 'bg-info';
  } else {
    message_box_class_name = 'chat-message-left';
    message_text_class_name = '';
    message_owner_name = `<div class="text-muted small text-nowrap mt-2">${data.additional_info.full_name}</div>`;
  }

  let message_box = `<div class="${message_box_class_name} pb-4">
    <div>
      <img
        class="img img-circle img-thumbnail isTooltip"
        style="width: 60px; height: 60px; border-radius: 50%;"
        src="${data.user_avatar_url}"
      >
      </div>
        <div class="flex-shrink-1 ${message_text_class_name} rounded py-2 px-3 mr-3 text-wrap" style="width: 40vw">
          ${message_owner_name}
          ${data.text}
        <div class="text-muted small text-nowrap mt-2">${timeAgo(data.created_at)}</div>
      </div>
    </div>`;

  element.append(message_box);
}