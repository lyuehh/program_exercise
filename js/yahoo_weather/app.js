var app = angular.module('app', []);


app.config(['$httpProvider', function($httpProvider) {
  $httpProvider.defaults.useXDomain = true;
  delete $httpProvider.defaults.headers.common['X-Requested-With'];
}]);

app.controller('AppCtrl',['$scope','$http', function($scope, $http) {
  var searchUrl = 'http://query.yahooapis.com/v1/public/yql?format=json&diagnostics=true&callback=&q=';
  var weatherUrl = 'http://query.yahooapis.com/v1/public/yql?format=json&diagnostics=true&callback=&q=';
  var q = 'select * from geo.places where text=';
  var qW = 'select * from weather.forecast where woeid=';
  $scope.search = function(city) {
    var qu = q + '"' + city +'"';
    var encodeU = encodeURIComponent(qu);
    var u = searchUrl + encodeU;
    $http.get(u).success(function(ret) {
      if(!ret.query.results) {
        $scope.woeid = 'error';
      } else {
        $scope.woeid = ret.query.results.place.woeid;
        var u2 = weatherUrl + qW + $scope.woeid + '&u=c';
        $http.get(u2).success(function(ret) {
          console.log(ret);
          $scope.desc = ret.query.results.channel.item.description;
        }).error(function(ret) {
          console.log(ret);
        });
      }
    }).error(function(ret) {
      console.log(ret);
    });
  };
}]);
