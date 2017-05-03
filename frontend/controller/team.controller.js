'use strict';

(() => {
	angular
		.module('app')
		.controller('team-controller', team_controller);

	function team_controller($scope, $window, $location, $routeParams, TeamService) {

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
			if($window.sessionStorage.profile == "undefined"){
            	window.location.href="#!/";
	        	return;
        	}
			TeamService
				.get_team_profile($scope.team_id)
				.then(function(res) {
					$scope.user = res[0];
				}, function(err) {
					console.log(err);
				});
		}

		$scope.team = [];
		$scope.team_id = $routeParams.team_id;

		$scope.get_team_match = () => {
			TeamService
				.get_team_match($scope.team_id)
				.then(function(res) {
					$scope.team = res[0];
				}, function(err) {
					console.log(err);
				});
		}

		$scope.team_id = $routeParams.team_id;

		$scope.get_team= () => {
			TeamService
				.get_team($scope.team_id)
				.then(function(res) {
					$scope.currTeam = res[0][0];
					console.log(res[0][0])
				}, function(err) {
					console.log(err);
				});
		}
    }
})();