'use strict';

(() =>{
	angular
		.module('app')
		.controller('LogController',LogCtrl);

		LogCtrl.$inject['$scope', '$location', 'LogService'];

		function LogCtrl($scope, $window, $filter, LogService) {


		}

})();