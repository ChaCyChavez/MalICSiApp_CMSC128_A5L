'use strict';
 
(() =>{
	angular
		.module('app')
		.controller('log-controller',LogCtrl);

		function LogCtrl($scope, $location, LogService, $interval) {
			$scope.search = {}
			$scope.get_log = function(){
				LogService
				.get_log()
				.then(function(res){
					$scope.logs = res[0];
				},function(err){
					console.log(err);
				})
			}

			$scope.get_all_logs = function(){
				LogService
				.get_all_logs()
				.then(function(res){
					$scope.logs = res[0];
				},function(err){
					console.log(err);
				})
			}
		}
})();