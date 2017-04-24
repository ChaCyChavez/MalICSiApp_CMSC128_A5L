'use strict';

(() => {
	angular
		.module('app')
		.factory('GamePerSportService', GamePerSportService);

		GamePerSportService.$inject = ['$window', '$http', '$q', '$httpParamSerializer'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function GamePerSportService($window, $http, $q, $httpParamSerializer) {
			const get_game_per_sport = (data) => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					url: '/api/get-game-per-sport/' + data,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const get_all_sport = (data) => {
				let deferred = $q.defer();
				console.log(data);
				console.log("In service\n");

				$http({
					method: 'GET',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/get-all-sport/',
					headers: headers
				})
				.then(function(res) {
					console.log(res.data);
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}


			let service = {};
			service.get_game_per_sport = get_game_per_sport;
			service.get_all_sport = get_all_sport;
			return service;
		}
})();