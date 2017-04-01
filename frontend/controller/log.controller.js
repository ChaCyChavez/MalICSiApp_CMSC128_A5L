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
					$scope.logs = res;
					console.log(logs);
				},function(err){
					console.log(err);
				})
			}

			$scope.get_all_logs = function(){
				LogService
				.get_all_logs()
				.then(function(res){
					$scope.allLogs = res[0];
					console.log($scope.allLogs);
				},function(err){
					console.log(err);
				})
			}
		}

})();