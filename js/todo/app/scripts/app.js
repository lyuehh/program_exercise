'use strict';

angular.module('todoApp', [])
  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/todo', {
        templateUrl: 'views/todo.html',
        controller: 'TodoCtrl'
      })
      .when('/trs', {
        templateUrl: 'views/trs.html',
        controller: 'TrsCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
