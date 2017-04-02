'use strict';

(() => {
	angular
		.module('app')
		.factory('TeamService', TeamService);

		// TeamService.$inject = ['$http', '$q', '$window'];

		const headers = {
		    'content-type': 'application/x-www-form-urlencoded'
		};


		function TeamService($http, $q, $window) {

			const get_all_account = () => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-all-account/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				});
				return deferred.promise;
			}

			let service = {};
			service.get_all_account = get_all_account;
			return service;
		}
})();
