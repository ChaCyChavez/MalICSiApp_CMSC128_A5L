'use strict';

(() => {
	angular
		.module('app')
		.factory('TournamentService', TournamentService);

		TournamentService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function TournamentService($window, $http, $q) {

			let service = {};
			return service;

		}
})();