'use strict'

angular.module('baseApp', [
  'ngCookies',
  'ngResource',
  'ngSanitize',
  'ngRoute'
])
  .config ($routeProvider, $locationProvider, $httpProvider, $rootScopeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'partials/main'
        controller: 'MainCtrl'
      .when '/login',
        templateUrl: 'partials/login'
        controller: 'LoginCtrl'
      .when '/signup',
        templateUrl: 'partials/signup'
        controller: 'SignupCtrl'
      .when '/settings',
        templateUrl: 'partials/settings'
        controller: 'SettingsCtrl'
        authenticate: true
      .when '/dashboard',
        templateUrl: 'partials/dashboard'
        controller: 'DashboardCtrl'
        authenticate: true
      .when '/404',
        templateUrl: 'partials/404'
        controller: '404Ctrl'
      .otherwise
        redirectTo: '/404'

    $locationProvider.html5Mode true
  
    # Intercept 401s and redirect you to login
    $httpProvider.interceptors.push ['$q', '$location', ($q, $location) ->
      responseError: (response) ->
        if response.status is 401
          $q.reject response
        else
          $q.reject response
    ]
  .run ($rootScope, $location, Auth) ->
    
    # Redirect to login if route requires auth and you're not logged in
    # Redirect to dashboard if user is logged and tries to access / route
    $rootScope.$on '$routeChangeStart', (event, next) ->
      $location.path '/login'  if next.authenticate and not Auth.isLoggedIn()
      $location.path '/dashboard' if (next.originalPath == '/' or next.originalPath == '/login' or next.originalPath == '/signup') and Auth.isLoggedIn()
