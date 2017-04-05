'use strict';

(() => {
	angular
		.module('app')
		.factory('SportService', SportService);

		SportService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function SportService($window, $http, $q) {

			const get_match = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: true},
					url: '/api/get-sport-team/' + data.sport_id,
					headers: headers
					
				})
				.then(function(res) {
					deferred.resolve(res);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const get_court = function(data) {
				$http({
					method: 'GET',
					xhrFields: {withCredentials: true},
					url: '/api/get-all-court/',
					headers: headers
					
				})
				.then(function(res) {
					deferred.resolve(res);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			let service = {};
			service.get_match 				= get_match;			
			service.get_court 				= get_court;			
			return service;

		}
})();