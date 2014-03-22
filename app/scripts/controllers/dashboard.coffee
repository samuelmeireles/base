'use strict'

angular.module('baseApp')
  .controller 'DashboardCtrl', ($scope, $http) ->
    $http.get('/api/awesomeThings').success (awesomeThings) ->
      $scope.awesomeThings = awesomeThings
