$( document ).on('turbolinks:load', function(){
  var current = new Date();
  var currenthour = current.getHours();
  LOW_LIMIT = 400;

  let random = Math.floor(Math.random() * 100);

  function suffix(num) {
    const n = (num - LOW_LIMIT) % 10;
    if(n === 1) {
      return 'посетитель';
    } else if (n >= 2 && n < 5) {
      return 'посетителя';
    } else {
      return 'посетителей';
    }
  }

  if(currenthour >= 11 && currenthour < 24) {
    pos = random + LOW_LIMIT;
    howMuchPos = 'Зараз на сайті ', pos, ' ', suffix(pos);
    opa = $('#howmuchpos');
    var my = "Text";
    opa.html(howMuchPos);
  }
}) 



