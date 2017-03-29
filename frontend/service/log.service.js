'use strict';

(() => {
	angular
		.module('app')
		.factory('LogService', LogService);

		LogService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function LogService($window, $http, $q) {

			let service = {};
			return service;

		}
})();