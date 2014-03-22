'use strict'

angular.module('baseApp')

  .controller 'SignupHomeCtrl', ($scope, $location, $rootScope, Auth) ->
    $scope.user = {}
    $scope.errors = {}
    $scope.register = (form) ->
      $scope.submitted = true

      if form.$valid
         Auth.createUser(
           name: $scope.user.name
           email: $scope.user.email
           password: $scope.user.password
         ).then( ->
           # Account created, redirect to home
           $location.path '/dashboard'
         ).catch( ->
           $rootScope.userTemp = angular.copy $scope.user
           $location.path '/signup'
         )
      else
        $rootScope.userTemp = angular.copy $scope.user
        $location.path '/signup'

  .controller 'MainCtrl', ($scope) ->
