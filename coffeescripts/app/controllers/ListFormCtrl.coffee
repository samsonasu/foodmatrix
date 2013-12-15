angular.module('foodmatrix.controllers')

.controller 'ListFormCtrl', ($scope, $routeParams, $location, Lists) ->
  if $routeParams.listId is'new'
    $scope.list = {
      attributes: [{name: ""}]
    }
    $scope.title = "New List"
  else
    $scope.list = Lists.get($routeParams.listId)
    $scope.title = $scope.list.name

  $scope.rightButtons = [
    type: 'button-clear ion-plus'
    content: "Add",
    tap: ->
      alert('add list');
  ]

  $scope.addAttribute = ->
    $scope.list.attributes.push {}

  $scope.removeAttribute = (attr)-> 
    index = $scope.list.attributes.indexOf(attr)
    $scope.list.attributes.splice(index, 1)

  $scope.save = -> 
    Lists.save($scope.list)
    $location.path("#/lists/" + $scope.list.id)
