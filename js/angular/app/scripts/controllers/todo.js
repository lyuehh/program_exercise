'use strict';

angular.module('angularApp')
  .controller('TodoCtrl', function ($scope) {
    $scope.todoLists = [
      {done: false, value: 'todo1'},
      {done: false, value: 'todo2'},
      {done: false, value: 'todo3'},
      {done: true, value: 'todo4'}
    ];
    $scope.add = function(t) {
      this.todoLists.push({
        done:false,
        value: t.value
      });
      $scope.t.value = '';
    };
    $scope.remaining = function() {
      return this.todoLists.length - this.todoLists.filter(function(t) {
        return t.done;
      }).length;
    };
    $scope.clear = function() {
      var reset = this.todoLists.filter(function(t) {
        return !t.done;
      });
      this.todoLists = reset;
    };
  });
