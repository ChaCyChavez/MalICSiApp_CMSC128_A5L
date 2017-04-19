'use strict'

let mainApp = angular.module("app", ['ngRoute']);

mainApp.config(function($routeProvider, $locationProvider) {
	$routeProvider
		.when('/', {
			templateUrl: 'views/login_register.html',
			controller: 'login-register-controller'
		})
		.when('/game-event', {
			templateUrl: 'views/game_event.html',
			controller: "game-event-controller"
		})
		.when('/game-per-sport/:sport_id', {
			templateUrl: 'views/game_per_sport.html',
			controller: "game-per-sport-controller"
		})
		.when('/profile/:account_id?', {
			templateUrl: 'views/profile.html',
			controller: 'profile-controller'
		})
		.when('/participant/:game_id', {
			templateUrl: 'views/participant.html',
			controller: 'participant-controller'
		})
		.when('/sponsor/:game_id', {
			templateUrl: 'views/sponsor.html',
			controller: 'sponsor-controller'
		})
		.when('/user', {
			templateUrl: 'views/user.html',
			controller: 'user-controller'
		})
		.when('/sport/:sport_id', {
			templateUrl: 'views/sport.html',
			controller: 'sport-controller'
		})
		.when('/sports/:game_id', {
			templateUrl: 'views/sports.html',
			controller: 'sports-controller'
		})
		.when('/result/:sport_id', {
			templateUrl: 'views/result.html',
			controller: 'result-controller'
		})
		.when('/match/:match_id', {
			templateUrl: 'views/match.html',
			controller: 'match-controller'
		})
		.when('/team/:team_id', {
			templateUrl: 'views/team.html',
			controller: 'team-controller'
		})
		.when('/activity-log', {
			templateUrl: 'views/activity_log.html'
		})
		.when('/error_404', {
			templateUrl: 'views/error_404.html',
			controller: 'error-404-controller'
		})
		.otherwise({
			redirectTo: '/error_404'
		});
})
