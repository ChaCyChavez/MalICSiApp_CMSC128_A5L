'use strict';

(() => {
	angular
		.module('app')
		.factory('GameEventService', GameEventService);

		ChitterService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/json'
		};

		function GameEventService($window, $http, $q) {

			const add_game_event = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'POST',
					params: data,
					xhrFields: {withCredentials: false},
					url: '/api/add-game-event',
					headers: headers
				})
				.then(function(res) {
					//$window.location.href = '/#!/game-event';
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}


			let service = {};
			service.add_game_event 				= add_game_event;
			return service;
		}
})();