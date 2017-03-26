var mainApp = angular.module("app", ['ngRoute']);

mainApp.config(function($routeProvider) {
	$routeProvider
		.when('/', {
			templateUrl: 'views/login_register.html',
			controller: "login-register-controller"
		})
		.when('/game-event', {
			templateUrl: 'views/game_event.html',
			controller: "game-event-controller"
		})
		.when('/profile', {
			templateUrl: 'views/profile.html',
			controller: 'profile-controller'
		})
		.when('/participant', {
			templateUrl: 'views/participant.html',
			controller: 'participant-controller'
		})
		.when('/registered-user', {
			templateUrl: 'views/registered_user.html',
			controller: 'registered-user-controller'
		})
		.when('/sponsor', {
			templateUrl: 'views/sponsor.html',
			controller: 'sponsor-controller'
		})
		.when('/user', {
			templateUrl: 'views/user.html',
			controller: 'user-controller'
		})
		.when('/sport', {
			templateUrl: 'views/sport.html',
			controller: 'sport-controller'
		})
		.when('/sports', {
			templateUrl: 'views/sports.html',
			controller: 'sports-controller'
		})
		.when('/result', {
			templateUrl: 'views/result.html',
			controller: 'result-controller'
		})
		.when('/match', {
			templateUrl: 'views/match.html',
			controller: 'match-controller'
		})
		.when('/error_404', {
			templateUrl: 'views/error_404.html',
			controller: 'error-404-controller'
		})
		.otherwise({
			redirectTo: '/error_404'
		});
})
