
var TestCtrl = function($scope){
    $scope.data = [
        {name: 'B', age: 4},
        {name: 'A', age: 1},
        {name: 'D', age: 3},
        {name: 'C', age: 3},
    ];
};

var TestCtrl2 = function($scope) {
    $scope.data = [
        {name: 'B', age: 4},
        {name: 'A', age: 1},
        {name: 'D', age: 3},
        {name: 'C', age: 3},
    ];
};

var TestCtrl3 = function($scope) {
    $scope.data = [
        {name: 'B', age: 4},
        {name: 'A', age: 1},
        {name: 'D', age: 3},
        {name: 'C', age: 3},
    ];

    $scope.f= function(e) {
        return e.age > 2;
    };
};

var TestCtrl4= function($scope) {
    $scope.a = new Date();
};

var TestCtrl5 = function($scope) {
    $scope.data = [
        {name: 'B', age: 4},
        {name: 'A', age: 1},
        {name: 'D', age: 3},
        {name: 'C', age: 3},
    ];
};
var TestCtrl6 = function($scope) {
    $scope.data = [
        {name: 'B', age: 4},
        {name: 'A', age: 1},
        {name: 'D', age: 3},
        {name: 'C', age: 3},
    ];
};
angular.bootstrap(document.documentElement);

