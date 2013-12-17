// Generated by CoffeeScript 1.6.1
(function() {

  angular.module('foodmatrix.controllers').controller('ListsCtrl', function($scope, $location, Lists) {
    $scope.lists = Lists.all();
    $scope.rightButtons = [
      {
        type: 'button-clear ion-plus',
        content: "Add",
        tap: function() {
          return alert('add list');
        }
      }
    ];
    $scope.editList = function($event, listId) {
      $event.preventDefault();
      return $location.path("lists/" + listId + "/edit");
    };
    $scope.$on('tab.shown', function() {});
    return $scope.$on('tab.hidden', function() {});
  });

}).call(this);
