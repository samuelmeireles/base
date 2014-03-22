'use strict'

angular.module('baseApp')
  .controller 'SignupCtrl', ($scope, $rootScope, $location, Auth) ->

    $scope.user = {}
    if $rootScope.userTemp
      $scope.user = angular.copy $rootScope.userTemp
      delete $rootScope.userTemp

    $scope.errors = {}
    if $rootScope.errorsTemp
      $scope.errors = angular.copy $rootScope.errorsTemp
      delete $rootScope.errorsTemp
      
    $scope.redirected = (form) ->
      if Object.keys($scope.user).length != 0 then $scope.register(form)

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
        ).catch( (err) ->
          err = err.data
          $scope.errors = {}
          
          # Update validity of form fields that match the mongoose errors
          angular.forEach err.errors, (error, field) ->
            form[field].$setValidity 'mongoose', false
            $scope.errors[field] = error.type
        )
