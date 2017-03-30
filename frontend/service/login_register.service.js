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

			let service = {

			};
			
			return service;

		}
})();