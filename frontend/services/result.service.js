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
			const init_matches = (data) => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-sport-matches/' + data.sport_id,
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
			service.init_matches = init_matches;
			return service;
		}

})();
