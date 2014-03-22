'use strict'

angular.module('baseApp')
  .controller 'NavbarCtrl', ($scope, $location, Auth) ->
    $scope.menu = [
      title: 'Dashboard'
      link: '/dashboard'
     ,
      title: 'Other'
      link: '/other'
    ]
    
    $scope.logout = ->
      Auth.logout().then ->
        $location.path "/"
    
    $scope.isActive = (route) ->
      route is $location.path()
