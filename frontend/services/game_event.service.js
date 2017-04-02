'use strict';

(() => {
	angular
		.module('app')
		.factory('GameEventService', GameEventService);

		GameEventService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function GameEventService($window, $http, $q) {
			const edit_game = function(data) {
				let deferred = $q.defer();
				console.log(data);
				$http({
					method: 'POST',
					data: data,
					xhrFields: {withCredentials: false},
					url: '/api/update-game-event/',
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
			return service;
		}
})();
