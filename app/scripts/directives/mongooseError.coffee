'use strict'

###
Removes server error when user updates input
###
angular.module('baseApp')
  .directive 'mongooseError', ->
    restrict: 'A'
    require: 'ngModel'
    link: (scope, element, attrs, ngModel) ->
      element.on 'keydown', ->
        ngModel.$setValidity 'mongoose', true
  
