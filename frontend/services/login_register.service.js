'use strict';

(() => {
	angular
		.module('app')
		.factory('LoginRegisterService', LoginRegisterService);

		LoginRegisterService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function LoginRegisterService($window, $http, $q) {

			const retrieve_account = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'POST',
					params: data,
					xhrFields: {withCredentials: false},
					url: '/api/login-account/',
					headers: headers
				})
				.then(function(res) {
					$window.location.href = '/#!/game-event';
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}


			let service = {};
			service.retrieve_account 				= retrieve_account;
			return service;
		}
})();