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
      .when('/renren2', {
        templateUrl: 'views/renren2.html',
        controller: 'RenRen2'
      })
      .when('/width', {
        templateUrl: 'views/width.html',
        controller: 'Width'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
