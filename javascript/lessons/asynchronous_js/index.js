let name = document.getElementById("name");
let profile_image = document.getElementById("profile_image");
let followers = document.getElementById("followers");

function search() {
  let username = document.getElementById("username").value;
  let url = "https://api.github.com/users/" + username;
  fetch(url)
    .then((response) => {
      if (response.ok) {
        return response.json();
      }
      throw new Error("Something went wrong");
    })
    .then(function (response) {
      name.innerText = response.name;
      profile_image.src = response.avatar_url;
      followers.innerText = response.followers + " Followers";
    })
    .catch((error) => {
      console.log(error);
      name.innerText = "Wrong Name";
      profile_image.src =
        "https://library.kissclipart.com/20180902/abe/kissclipart-human-error-icon-png-clipart-computer-icons-error-c18d7a413a983be1.png";
      followers.innerText = "0 Followers";
    });
}
