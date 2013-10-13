'use strict';

angular.module('todoApp')
  .controller('TipsCtrl', function ($scope) {
    //$('.btn1').tips('aaabbb');
    $('.btn1').tips('<script>alert("123")</script>');
    //$('.link1').tips('aaabbb');
  });
