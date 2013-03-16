
'use strict';

describe('Controller: TodoCtrl', function () {

  // load the controller's module
  beforeEach(module('angularApp'));

  var TodoCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller) {
    scope = {};
    TodoCtrl = $controller('TodoCtrl', {
      $scope: scope
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(scope.todoLists.length).toBe(4);
  });
});
