'use strict';

(() => {
    angular
        .module('app')
        .controller('match-controller', match_controller);

    function match_controller($scope, $location, MatchService) {

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

        let x = $location.path().toString().split("/");
        $scope.match_id = parseInt(x[x.length-1]);
        $scope.court = undefined;
        $scope.match = undefined;
        $scope.match_teams_scores = [];

        $scope.init_match = () => {
            MatchService
                .init_match($scope.match_id)
                .then(function(res) {
                    $scope.match = res[0][0];
                    console.log(res[0]);
                }, function(err) {
                    console.log(res[0]);
                })
        }

        $scope.init_match_court = () => {
            MatchService
                .init_match_court($scope.match_id)
                .then(function(res) {
                    $scope.court = res[0][0];
                    console.log(res[0]);
                }, function(err) {
                    console.log(res[0]);
                })
        }

        $scope.init_match_teams = () => {
            MatchService
                .init_match_teams_scores($scope.match_id)
                .then(function(res) {
                    $scope.match_teams_scores = res[0];
                    console.log(res[0]);
                    MatchService.determine_winner($scope.match_teams_scores);
                }, function(err) {
                    console.log(res[0]);
                })
        }
    }
})();
