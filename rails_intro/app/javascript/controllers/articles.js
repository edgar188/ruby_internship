document.getElementById('button_plus').onclick = function () {
  add();
  counter_increment();
};

function add() {
  let p = document.createElement('p');
  let text = document.createElement('input');
  text.setAttribute('type', 'text');
  text.setAttribute('class', 'form-text-field mt');
  text.setAttribute('placeholder', 'Art name');
  text.setAttribute('name', `article[article_arts_attributes[${counter}]][name]`);
  p.appendChild(text);
  document.getElementById('article_arts').appendChild(p);
}

let counter = 0;

function counter_increment() {
  counter++;
}
