'use strict';

angular.module('todoApp')
  .controller('TrsCtrl', function ($scope) {
    $scope.obj = [[["串","string","Chuàn",""]],
      [["noun",["串","弦","线","绳子","绳","细线","鞭","绲"],
        [["串",["string"],,0.062936753],
          ["弦",["string","chord","bowstring","hypotenuse","subtense","catgut"],,0.012200845],
          ["线",["line","wire","thread","route","string","boundary"],,0.0037210477],
          ["绳子",["rope","string","cord"],,0.0024403227],
          ["绳",["rope","cord","string"],,0.0024024891],
          ["细线",["thread","string"],,0.00018238787],
          ["鞭",["whip","lash","string","firecracker","iron staff used as a weapon"],,8.8011775e-06],
          ["绲",["cord","embroidered sash","string"],,5.093731e-06]]],
        ["verb",["纫"],
          [["纫",["thread","string"],,7.411335e-06]]]],"en",,[["串",[5],0,0,1000,0,1,0]],[["string",4,,,""],["string",5,[["串",1000,0,0],["字符串",0,0,0],["的字符串",0,0,0],["字符串的",0,0,0],["弦",0,0,0]],[[0,6]],"string"]],,,[["en"]],3];
    $scope.en = $scope.obj[0][0][1];
    $scope.zh = $scope.obj[0][0][0];
    $scope.pinyin = $scope.obj[0][0][2];
    $scope.type = $scope.obj[1].length + "-> " + $scope.obj[1][0][0] + ',' + $scope.obj[1][1][0];
    // console.log($scope.obj[1][0][0] + ': ' + $scope.obj[1][0][1]);
    // _.each($scope.obj[1][0][1], function(f,i) {
    //   console.log($scope.obj[1][0][1][i] + ": " + $scope.obj[1][0][2][i][1]);
    // });
    // console.log($scope.obj[1][1][0] + ': ' + $scope.obj[1][1][1]);
    // _.each($scope.obj[1][1][1], function(f,i) {
    //   console.log($scope.obj[1][1][1][i] + ": " + $scope.obj[1][1][2][i][1]);
    // });
    // console.log($scope.obj[1].length + ': ' + $scope.obj[1]);
    //var type = $scope.obj[1].length;
    _.each($scope.obj[1], function(f,i) {
      console.log($scope.obj[1][i][0] + ': ' + $scope.obj[1][i][1]);
      _.each($scope.obj[1][i][1], function(f,j) {
        console.log($scope.obj[1][i][1][j] + ": " + $scope.obj[1][i][2][j][1]);
      });
      console.log('');
    });
  });
