// Generated by CoffeeScript 1.6.1
(function() {

  angular.module('foodmatrix.controllers').controller('ListCtrl', function($scope, $routeParams, $location, Lists) {
    $scope.list = Lists.get($routeParams.listId);
    return $scope.rightButtons = [
      {
        type: 'button-clear ion-plus',
        content: "Add Item",
        tap: function() {
          var newId, path, _base;
          newId = new Date().getTime();
          (_base = $scope.list).items || (_base.items = []);
          $scope.list.items.push({
            id: newId,
            ratings: {}
          });
          Lists.save($scope.list);
          debugger;
          path = "/lists/" + $scope.list.id + "/items/" + newId;
          return $location.path(path);
        }
      }
    ];
  });

}).call(this);
