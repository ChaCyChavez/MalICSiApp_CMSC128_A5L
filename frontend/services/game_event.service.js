'use strict';

(() => {
	angular
		.module('app')
		.factory('GameEventService', GameEventService);

		GameEventService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/json'
		};

		function GameEventService($window, $http, $q) {
		}
})();