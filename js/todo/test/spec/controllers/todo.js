
'use strict';

describe('Controller: TodoCtrl', function () {

  // load the controller's module
  beforeEach(module('todoApp'));

  var TodoCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller) {
    scope = {};
    TodoCtrl = $controller('TodoCtrl', {
      $scope: scope
    });
  }));

  it('should have 4 todo items', function () {
    expect(scope.todoLists.length).toBe(4);
  });

  it('add new item', function() {
    input('value').enter('aa');
    element('.btn').click();
    expect(scope.todoLists.length).tobe(5);
  });

});
