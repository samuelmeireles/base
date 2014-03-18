'use strict'

angular.module('baseApp')
  .factory 'Session', ($resource) ->
    $resource '/api/session/'
