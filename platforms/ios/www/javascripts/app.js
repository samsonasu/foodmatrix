// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array or 'requires'
// 'starter.services' is found in services.js
// 'starter.controllers' is found in controllers.js
angular.module('foodmatrix', ['ionic', 'ngRoute', 'ngAnimate', 'foodmatrix.services', 'foodmatrix.controllers'])

.config(function ($compileProvider){
  // Needed for routing to work
  $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|file|tel):/);
})

.config(function($routeProvider, $locationProvider) {

  // Set up the initial routes that our app will respond to.
  // These are then tied up to our nav router which animates and
  // updates a navigation bar
  $routeProvider.when('/home', {
    templateUrl: 'templates/app.html',
    controller: 'HomeCtrl'
  });

  // if the url matches something like /pet/2 then this route
  // will fire off the PetCtrl controller (controllers.js)
  $routeProvider.when('/lists/:listId', {
    templateUrl: 'templates/list.html',
    controller: 'ListCtrl'
  });

  $routeProvider.when('/lists/:listId/edit', {
    templateUrl: 'templates/list_form.html',
    controller: 'ListFormCtrl'
  });
  
  $routeProvider.when('/lists/:listId/items/:itemId', {
    templateUrl: 'templates/item.html',
    controller: 'ListItemCtrl'
  });

  // if none of the above routes are met, use this fallback
  // which executes the 'AppCtrl' controller (controllers.js)
  $routeProvider.otherwise({
    redirectTo: '/home'
  });

})

.filter('getById', function() {
  return function(input, id) {
    var i=0, len=input.length;
    for (; i<len; i++) {
      if (+input[i].id == +id) {
        return input[i];
      }
    }
    return null;
  };
});


// Define modules here so I can use more than one file without caring about load order
angular.module('foodmatrix.controllers', []);
angular.module('foodmatrix.services', []);
