#A simple controller that shows a tapped item's data
angular.module('foodmatrix.controllers').controller 'ListCtrl', ($scope, $routeParams, $location, Lists) ->
    $scope.list = Lists.get($routeParams.listId)
    $scope.rightButtons = [
      type: 'button-clear ion-plus',
      content: "Add Item",
      tap: ->
        newId = new Date().getTime()
        $scope.list.items ||= []
        $scope.list.items.push
          id: newId
          ratings: {}
        Lists.save($scope.list)
        debugger
        path = "/lists/#{$scope.list.id}/items/#{newId}"
        $location.path path
    ]