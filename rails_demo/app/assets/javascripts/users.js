window.onload = function () {
  let users_table = document.getElementById('users_table');
  let users_table_body = document.getElementById('users_table_body');
  let users_count = document.getElementById('users_count');
  let users_search = document.getElementById('users_search');

  function render_users(users) {
    let users_count_new = users.length;

    // Show users count
    if (users_count_new < 1) {
      users_table.style = 'display: none;';
      users_count.textContent = 'NO RESULT';
    } else {
      users_count.textContent = `Total ${users_count_new} users`;
      users_table.style = 'display: block;';
    }

    // Hide elements
    for (let i = 0; i < users_table_body.childNodes.length; i++) {
      users_table_body.childNodes[i].style = 'display: none;';
    }

    // Show searched users
    for (let i = 0; i < users_count_new; i++) {
      let user = users[i];
      let row = users_table.insertRow(1);
      let full_name = row.insertCell(0);
      let email = row.insertCell(1);
      let gender = row.insertCell(2);
      let birth_date = row.insertCell(3);
      let role = row.insertCell(4);
      full_name.innerHTML = `<td ><a href="users/${user.id}"> ${user.first_name}  ${user.last_name} </a> </td> `;
      email.innerHTML = `<td>${user.email}</td>`;
      gender.innerHTML = `<td>${user.gender}</td>`;
      birth_date.innerHTML = `<td>${user.birth_date}</td>`;
      role.innerHTML = `<td>${user.role}</td>`;
    }
  }

  if (users_search) {
    let timeout = null;

    users_search.addEventListener('keyup', function (event) {
      clearTimeout(timeout);

      timeout = setTimeout(function () {
        axiosGET('users/search?query=' + event.target.value)
          .then((res) => render_users(res['data']['result']))
          .catch((error) => alert(error.message));
      }, 300);
    });
  }
};
