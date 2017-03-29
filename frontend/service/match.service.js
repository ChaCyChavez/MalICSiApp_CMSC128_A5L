'use strict';

(() => {
	angular
		.module('app')
		.factory('MatchService', MatchService);

		MatchService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function MatchService($window, $http, $q) {

			let service = {};
			return service;

		}
})();