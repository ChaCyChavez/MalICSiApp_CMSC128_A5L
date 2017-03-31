'use strict';

(() =>{
	angular
		.module('app')
		.controller('LogController',LogCtrl);

		LogCtrl.$inject = ['$scope', '$location', 'LogService'];

		function LogCtrl($scope, $location, LogService) {

			$scope.get_log = function(){
				LogService
				.get_log()
				.then(function(res){
					$scope.allLogs =res;
				},function(err){
					console.log(err);
				})
			}
		}

})();