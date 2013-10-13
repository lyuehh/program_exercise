'use strict';

angular.module('todoApp').controller('RenRen3', function() {
  console.log('haha');

  var emails = ['asdf@qq.com', 'unamexx@gmail.com', 'hahayes@sina.com', 'psed@sohu.com'];
  $('#name').keyup(function(e) {
    console.log('keyup...');
  });
  $('#name').keydown(function(e) {
    console.log('keydown...');
  });
  $('#name').keypress(function(e) {
    console.log('keypress..');
  });
});
