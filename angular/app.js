
var TestCtrl = function($scope){
    $scope.a = '123';

    $scope.click = function(e) {
        // debugger;
        // console.log(e);
        // console.log(123);

        $scope.a = '456';
    };
};
angular.bootstrap(document.documentElement);

