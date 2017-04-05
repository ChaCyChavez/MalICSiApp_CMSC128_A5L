'use strict';

(() => {
	angular
		.module('app')
		.factory('GameEventService', GameEventService);

		GameEventService.$inject = ['$window', '$http', '$q', '$httpParamSerializer'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function GameEventService($window, $http, $q, $httpParamSerializer) {
			const edit_game = (data) => {
				let deferred = $q.defer();
				console.log(data);
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/update-game-event/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}
			const add_team = (data) => {
				let deferred = $q.defer();
				console.log(data);
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/add-team/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const join_account_to_team = (data) => {
				let deferred = $q.defer();
				console.log(data);
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/join-account-to-team/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const get_teams = (data) => {
				let deferred = $q.defer();

				console.log(data.game_id);
				$http({
					method: 'GET',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/get-game-teams/' + data.game_id,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}
			const delete_game = (data) => {
				let deferred = $q.defer();
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/delete-game-event/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const get_upcoming_games = (data) => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-upcoming-events/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const get_current_games = (data) => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-current-events/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const get_team_of_account = (data) => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-team-of-account/' + data.account_id + "/" + data.game_id,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}


	        const search_game = function(data) {
				let deferred = $q.defer();

				console.log(data);
				$http({
					method: 'GET',
					params: data,
					xhrFields: {withCredentials: true},
					url: '/api/get-game-event/'+data.game_name,
					headers: headers
				})
				.then(function(res) {
					// $window.location.href = '/#!/game-event';
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const add_game = function(data) {
				let deferred = $q.defer();
				console.log(data);
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/add-game-event/',
					headers: headers
				})
				.then(function(res) {
					// $window.location.href = '/#!/game-event';
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}


			let service = {};
			service.edit_game 	= 				edit_game;
			service.delete_game = 				delete_game;
			service.get_current_games 	= 		get_current_games;
			service.get_upcoming_games 	= 		get_upcoming_games;
			service.search_game 		= 		search_game;
			service.add_game 			= 		add_game;
			service.get_teams 			= 		get_teams;
			service.add_team 			= 		add_team;
			service.join_account_to_team = 		join_account_to_team;
			service.get_team_of_account = 		get_team_of_account;
			return service;
		}
})();
