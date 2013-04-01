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
      .when('/tips', {
        templateUrl: 'views/tips.html',
        controller: 'TipsCtrl'
      })
      .when('/renren1', {
        templateUrl: 'views/renren1.html',
        controller: 'RenRen1'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
