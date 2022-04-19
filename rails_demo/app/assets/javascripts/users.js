window.onload = function () {
  users_table = document.getElementById('users_table')
  users_search = document.getElementById('users_search')

  function render_users(users) {
    // render users and count
  }

  if (users_search) {
    users_search.oninput = (event) =>
      axiosGET('users/search?query=' + event.target.value)
        .then((res) =>
          console.log(res['data']['users'])
          // function(es['data']['users'])
        ).catch((error) =>
          alert(error.message)
        )
  }

};