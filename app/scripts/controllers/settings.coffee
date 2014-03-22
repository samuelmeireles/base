'use strict'

angular.module('baseApp')
  .controller 'SettingsCtrl', ($scope, User, Auth) ->
    $scope.errors = {}
    $scope.user = ''

    $scope.changePassword = (form) ->
      $scope.submitted = true
      
      if form.$valid
        Auth.changePassword($scope.user.oldPassword, $scope.user.newPassword)
        .then(->
          $scope.message = 'Password successfully changed.'
          $scope.user = ''
          $scope.resetForm form
        ).catch( ->
          form.password.$setValidity 'mongoose', false
          $scope.errors.other = 'Incorrect password'
          $scope.resetForm form
        )

    $scope.resetForm = (form) ->
      $scope.user = ''
      $scope.submitted = false
      form.$setPristine ''
