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
			let service = {};
			return service;

		}
})();