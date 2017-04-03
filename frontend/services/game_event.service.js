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
			const edit_game = function(data) {
				let deferred = $q.defer();

				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/update-game-event/',
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
			service.edit_game = edit_game;
			service.add_game = add_game;
			service.search_game = search_game;
			return service;
		}
})();
