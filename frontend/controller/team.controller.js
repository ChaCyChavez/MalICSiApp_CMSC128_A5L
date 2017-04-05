'use strict';

(() => {
	angular
		.module('app')
		.controller('team-controller', team_controller);

	function team_controller($scope, $location, $routeParams, TeamService) {

        $scope.view_profile = () => {
            window.location.href="#!/profile";
        }

        $scope.view_user = () => {
            window.location.href="#!/user";
        }

		$scope.logout = () => {
            window.location.href="#!/";
        }

		$scope.back_to_home = () => {
            window.location.href="#!/game-event";
        }
		
		$scope.user = [];
		$scope.team_id = $routeParams.team_id;

		$scope.get_team_profile = () => {
			TeamService
				.get_team_profile($scope.team_id)
				.then(function(res) {
					$scope.user = res[0];
					console.log(res);
				}, function(err) {
					console.log(err);
				});
		}

		$scope.teams = [];
		$scope.team_id = $routeParams.team_id;

		$scope.get_team_match = () => {
			TeamService
				.get_team_match($scope.team_id)
				.then(function(res) {
					$scope.team = res[0];
					console.log($scope.teams);
				}, function(err) {
					console.log(err);
				});
		}
    }
})();