var mainApp = angular.module("mainApp", ['ngRoute']);

mainApp.config(function($routeProvider) {
	$routeProvider
		.when('/landing', {
			templateUrl: 'views/landing.html',
            
		})
		.when('/home', {
			templateUrl: 'views/home.html',
            
		})
		.when('/profile', {
			templateUrl: 'views/profile.html',
            
		})
		.when('/participant', {
			templateUrl: 'views/participant.html',
            
		})
		.when('/registereduser', {
			templateUrl: 'views/registereduser.html',
            
		})
		.when('/sponsors', {
			templateUrl: 'views/sponsors.html',
            
		})
		.when('/user', {
			templateUrl: 'views/user.html',
            
		})
		.otherwise({
			redirectTo: '/landing'
		});
});
