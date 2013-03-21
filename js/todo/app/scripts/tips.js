$.fn.tips = function(str, time) {
  'use strict';
  var $el = $(this);
  var $body = $('body');

  str = str.replace('&', '&amp').replace('<', "&lt").replace('>','&gt').replace('/', "&#x2F");
  console.log(str);
  var template = $('' +
    '<div class="tips_all">' +
    '<div class="tips_top"></div>' +
    '<div class="tips_content">' +
    '<b></b>' +
    '<span>' + str + '</span>' +
    '<b class="tips_right"></b>' +
    '</div>' +
    '</div>' +
    '');
  var $html = template;
  $body.append($html);
  var t = $el.offset().top;
  var l = $el.offset().left;
  // var h = $html.height();
  $html.css('position', 'absolute');
  $html.css('top', t + 25);
  $html.css('left', l);
  if(!time) {
    time = 5;
  }
  setTimeout(function() {
    $html.remove();
  }, time * 1000);
};
