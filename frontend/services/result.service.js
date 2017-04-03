'use strict'; 

(() => {
	angular
		.module('app')
		.factory('ResultService', ResultService);

		ResultService.$inject = ['$window', '$http', '$q', '$httpParamSerializer'];

		const headers  = {
			'content-type' : 'application/x-www-form-urlencoded'
		};

		function ResultService($window, $http, $q, $httpParamSerializer) {

			const init_elimination = () => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-elimination-matches/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const init_semis = () => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-semis-matches/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const init_finals = () => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-finals-matches/',
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
			service.init_elimination = init_elimination;
			service.init_semis = init_semis;
			service.init_finals = init_finals;
			return service;
		}

})();
