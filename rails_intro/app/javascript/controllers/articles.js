let new_article_arts_count = 0;

function counter_increment() {
  new_article_arts_count++;
}

document.getElementById('add_article_art').onclick = function () {
  add_article_art();
  counter_increment();
};

function add_article_art() {
  let code_block = `<div>
    <input value="test" type="text" placeholder="Art name" name=article[article_arts_attributes][${new_article_arts_count}][name]>
    <input value="${new_article_arts_count}" type="number" placeholder="Art likes" name=article[article_arts_attributes][${new_article_arts_count}][likes]> <br/><br/>
    <input type="text" placeholder="Art comment" name=article[article_arts_attributes][${new_article_arts_count}][article_art_comments_attributes][${new_article_arts_count}][body]> <br/>
    <hr style="margin: 3px 0; height: 3px; background: black;" />
  </div=>`;
  document.getElementById("article_arts_list").innerHTML += code_block
}

