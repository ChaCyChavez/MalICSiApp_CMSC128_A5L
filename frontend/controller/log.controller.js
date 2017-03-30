'use strict';

(() =>{
	angular
		.module('app')
		.controller('LogController',LogCtrl);

		LogCtrl.$inject['$scope', '$window', '$filter', 'LogService'];

		function LogCtrl($scope, $window, $filter, LogService) {


		}

})();