'use strict'

angular.module('baseApp')
  .controller '404Ctrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings