'use strict';

(() => {
	angular
		.module('app')
		.factory('UserService', UserService);

		UserService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function UserService($window, $http, $q) {

			const get_all_account = () => {
				let deferred = $q.defer();
				
				$http({
					method: 'GET',
					url: '/api/get-all-account/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(res) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			let service = {};
			service.get_all_account = get_all_account;
			return service;
		}
})();
