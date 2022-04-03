document.getElementById('button_plus').onclick = function () {
  add();
  counter_increment();
};

let counter = 0;

function counter_increment() {
  counter++;
}

function add() {
  let p = document.createElement('p');
  // INPUT FIELD FOR ART NAME
  let article_art_name = document.createElement('input');
  article_art_name.setAttribute('type', 'text');
  article_art_name.setAttribute('placeholder', 'Art name');
  article_art_name.setAttribute('name', `article[article_arts_attributes][${counter}][name]`);
  // INPUT FIELD FOR ART LIKES
  let article_art_likes = document.createElement('input');
  article_art_likes.setAttribute('type', 'number');
  article_art_likes.setAttribute('placeholder', 'Art likes');
  article_art_likes.setAttribute('likes', `article[article_arts_attributes][${counter}][likes]`);
  p.appendChild(article_art_name);
  p.appendChild(article_art_likes);  
  document.getElementById('article_arts_list').appendChild(p);
}

