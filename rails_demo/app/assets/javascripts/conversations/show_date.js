function get_formatted_date(date, preformatted_date = false, hideYear = false) {
  let hours = date.getHours();
  let minutes = date.getMinutes();

  if (preformatted_date) {
    return `${preformatted_date} at ${hours}:${minutes}`;
  }
}

function time_ago(date_param) {
  if (!date_param) {
    return null;
  }

  let date = typeof date_param === 'object' ? date_param : new Date(date_param);
  let today = new Date();
  let isToday = today.toDateString() === date.toDateString();

  if (isToday) {
    return get_formatted_date(date, 'Today'); // Today at 10:20
  }
}