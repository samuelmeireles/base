'use strict'

angular.module('baseApp')
  .controller 'NavbarLoggedOutCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings
