// Generated by CoffeeScript 1.6.1
(function() {

  angular.module('foodmatrix.controllers').controller('ListItemCtrl', function($scope, $routeParams, $filter, $location, Lists) {
    var calculateRatings, _base;
    $scope.list = Lists.get($routeParams.listId);
    $scope.item = $filter('getById')($scope.list.items, $routeParams.itemId);
    (_base = $scope.item).ratings || (_base.ratings = {});
    $scope.rightButtons = [
      {
        content: "delete",
        type: 'ion-remove button-clear button-assertive',
        tap: function() {
          var index;
          index = $scope.list.items.indexOf($scope.item);
          $scope.list.items.splice(index, 1);
          Lists.save($scope.list);
          return history.back();
        }
      }
    ];
    calculateRatings = function() {
      var attr;
      $scope.ratedAttributes = (function() {
        var _i, _len, _ref, _results;
        _ref = $scope.list.attributes;
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          attr = _ref[_i];
          _results.push({
            name: attr.name,
            rating: $scope.item.ratings[attr.name]
          });
        }
        return _results;
      })();
      return $scope.ratedAttributes.push({
        name: "Overall",
        rating: $scope.item.ratings["Overall"]
      });
    };
    calculateRatings();
    $scope.setRating = function(name, rating) {
      $scope.item.ratings[name] = rating;
      calculateRatings();
      return Lists.save($scope.list);
    };
    return $scope.save = function() {
      Lists.save($scope.list);
      return history.back();
    };
  });

}).call(this);
