#The list of all the different lists (Pizza, wings, wine, etc) in the app
angular.module('foodmatrix.controllers')

.controller 'ListsCtrl', ($scope, $location, Lists) ->
  $scope.lists = Lists.all()
  $scope.rightButtons = [
    type: 'button-clear ion-plus'
    content: "Add",
    tap: ->
      alert('add list');
  ]
  $scope.editList = ($event, listId) ->
    $event.preventDefault()
    $location.path "lists/#{listId}/edit"

  $scope.$on 'tab.shown', ->
    # Might do a load here

  $scope.$on 'tab.hidden', ->
    # Blah