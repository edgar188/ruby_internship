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
    message_text_class_name = 'bg-light';
    message_owner_name = `<div class="text-muted small text-nowrap mt-2">${data.additional_info.full_name}</div>`;
  }

  let message_box = `
  ${message_owner_name}
  <div class="${message_box_class_name} pb-4">
      <img
        class="img img-circle img-thumbnail isTooltip"
        style="width: 60px; height: 60px; border-radius: 50%;"
        src="${data.user_avatar_url}">
      <div class="flex-shrink-1 ${message_text_class_name} rounded py-2 px-3 mr-3 text-wrap" style="width: 40vw">
        ${data.text}
        <div id="${data.id}" class="attachments d-flex flex-wrap"> </div>
        <div class="text-muted small text-nowrap mt-2">${time_ago(data.created_at)}</div>
      </div>
    </div>
  </div>`;

  element.append(message_box);

  // Render attachments
  for (let i = 0; i < data.attachments_url.length; i++) {
    let image_container = document.createElement('div');
    let img = document.createElement('img');
    image_container.className = 'message-image-container';
    img.src = data.attachments_url[i]
    img.style = 'width: 100%; height: 100%';
    image_container.appendChild(img);
    let el = document.getElementById(data.id);
    el.className = `attachments d-flex flex-wrap`
    el.appendChild(image_container);
    document.getElementById('message_attachments').value = '';
  }
}