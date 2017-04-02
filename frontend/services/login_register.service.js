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
					data: $.param(data),
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

			const register_account = function (data) {
				let deferred = $q.defer();
				console.log(data);
				$http({
					method: 'POST',
					data: $.param(data),
					xhrFields: {withCredentials: false},
					url: '/api/add-account/',
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
			service.retrieve_account 				= retrieve_account;
			service.register_account 				= register_account;
			return service;
		}
})();