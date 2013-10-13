'use strict';

angular.module('todoApp').controller('RenRen1', function () {
  var ul = $('.ul')[0];
  var li0 = $(ul).children()[0];
  var li1 = $(ul).children()[1];

  var $left = $('.left');
  var $right = $('.right');

  $left.click(function() {
    sleft();
  });
  $right.click(function() {
    sright();
  });

  function sleft() {
    ul.scrollLeft += -70;
    if(ul.scrollLeft <=0 ) {
      $left.addClass('disable');
    } else {
      $right.removeClass('disable');
    }
  }

  function sright() {
    ul.scrollLeft += 70;
    if(ul.scrollLeft >= (ul.scrollWidth - ul.clientWidth)) {
      $right.addClass('disable');
    } else {
      $left.removeClass('disable');
    }
  }

  // $(ul).scroll(function(e) {
  //   e.preventDefault();
  //   e.stopPropagation();
  // });

  ul.addEventListener(('onmousewheel' in ul) ? 'mousewheel' : 'DOMMouseScroll', function(e) {
    if((e.detail || -e.wheelDelta) > 0) {
      sright();
    } else {
      sleft();
    }
  }, true);
  window.ul = ul;
  window.li0 = li0;
  window.li1 = li1;
});
