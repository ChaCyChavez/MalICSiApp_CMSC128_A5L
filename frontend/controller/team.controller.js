'use strict';

(() => {
	angular
		.module('app')
		.controller('team-controller', team_controller);

		// team_controller.$inject = ['$scope', '$window', 'team_service'];
	
	function team_controller($scope, $location, TeamService) {
		$scope.user = [];

		$scope.logout = () => {
			$location.path("/").replace();
		}

		$scope.back_to_home = () => {
			$location.path("/game-event").replace();
		}
		
		$scope.get_team_profile = () => {
			TeamService
				.get_all_account()
				.then(function(res) {
					$scope.user = res[0];
					console.log($scope.user);
				}, function(err) {
					console.log(err);
				});
		}
    }
})();