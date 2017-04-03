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

			const delete_game = function(data) {
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
			let service = {};
			service.edit_game = edit_game;
			service.delete_game = delete_game;
			return service;
		}
})();
