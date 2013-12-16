angular.module('foodmatrix.controllers').controller 'ListItemCtrl', ($scope, $routeParams, $filter, $location, Lists) ->
    $scope.list = Lists.get($routeParams.listId);
    $scope.item = $filter('getById')($scope.list.items, $routeParams.itemId);
    $scope.item.ratings ||= {}

    $scope.rightButtons = [
      content: "delete",
      type: 'ion-remove button-clear button-assertive',
      tap: ->
        index = $scope.list.items.indexOf($scope.item)
        $scope.list.items.splice(index, 1)
        Lists.save($scope.list)
        history.back()
    ]
    

    calculateRatings = ->
      $scope.ratedAttributes = for attr in $scope.list.attributes
        name: attr.name
        rating: $scope.item.ratings[attr.name]

      $scope.ratedAttributes.push 
        name: "Overall"
        rating: $scope.item.ratings["Overall"]

    calculateRatings()

    $scope.setRating = (name, rating) ->
      $scope.item.ratings[name] = rating
      calculateRatings()
      Lists.save($scope.list)

    $scope.save = ->
      Lists.save($scope.list)
      history.back()
