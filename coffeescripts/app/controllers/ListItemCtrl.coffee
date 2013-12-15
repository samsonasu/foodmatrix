angular.module('foodmatrix.controllers').controller 'ListItemCtrl', ($scope, $routeParams, $filter, Lists) ->
    $scope.list = Lists.get($routeParams.listId);
    debugger
    $scope.item = $filter('getById')($scope.list.items, $routeParams.itemId);
    $scope.item.ratings ||= {}
    

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
