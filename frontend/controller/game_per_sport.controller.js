'use strict';
/*
localhost:8000/#!/game-per-sport/:sport-id
*/
(() => {
    angular
        .module('app')
        .controller('game-per-sport-controller', game_per_sport_controller);

    function game_per_sport_controller($scope, $location, $routeParams, GamePerSportService) {
        $scope.sprts = [];
        $scope.size = 0;
        $scope.loop = [];
        $scope.name = " ";
        let gamid = $routeParams.game_id;

        $scope.gps = GamePerSportService
            .get_game_per_sport(gamid)
            .then(
                function(res){
                    $scope.sprts = res[0];
                    $scope.name = res[0][0].game_name;
                    $scope.size = res[0].length;
                    $scope.loop = $scope.range($scope.size);
                },
                function(err){
                    console.log(err.data);
                });


        $scope.range = function(size) {
            var ret = [];

            for(var i = 0; i < size; i += 2){
                ret.push(i);
            }

            return ret;
        }

        // $scope.view_tournament_bracketing = () => {
        //     window.location.href="#!/result";
        // }

        // $scope.view_match = () => {
        //     window.location.href="#!/match";
        // }
        $scope.view_user = () => {
            window.location.href="#!/user";
        }

        // $scope.view_participant = () => {
        //     window.location.href="#!/participant";
        // }

        $scope.view_profile = () => {
            window.location.href="#!/profile";
        }

        $scope.logout = () => {
            window.location.href="#!/";
        }

        $scope.back_to_home = () => {
            window.location.href="#!/game-event";
        }
    }
})();
