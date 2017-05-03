'use strict';
 
(() =>{
	angular
		.module('app')
		.controller('log-controller',LogCtrl);

		function LogCtrl($scope, $window, $rootScope, $location, LogService, $interval) {
			$scope.search = {}
			$scope.get_log = function(){
				if($window.sessionStorage.profile == "undefined"){
	            	window.location.href="#!/";
		        	return;
	        	}
				LogService
				.get_log()
				.then(function(res){
					$scope.logs = res[0];
				},function(err){
					console.log(err);
				})
			}

			$scope.get_all_logs = function(){
				if($rootScope.profile === undefined){
                	window.location.href="#!/";
                	return;
            	}
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