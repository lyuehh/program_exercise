var TestCtrl = function($scope){

    $scope.see = function(){
      console.log($scope.test_form);
      console.log($scope.test_form.a);
      console.log($scope.test_form.$error);
    }

};

var TestCtrl2 = function($scope){
    $scope.a = "BB";
};

var TestCtrl3 = function($scope){
    $scope.a = "AA";
};

angular.bootstrap(document.documentElement);
