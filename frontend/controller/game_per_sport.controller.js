'use strict';
/*
localhost:8000/#!/game-per-sport/:sport-id
*/
(() => {
    angular
        .module('app')
        .controller('game-per-sport-controller', game_per_sport_controller);

    function game_per_sport_controller($scope, $location, GamePerSportService) {
        $scope.sprts = [];

        $scope.get_all_sport = GamePerSportService
            .get_all_sport()
            .then(
                function(res){
                    console.log(res);
                    $scope.sprts = res;
                },
                function(err){
                    console.log(err.data);
                });

        // $scope.gps = GamePerSportService
        //     .get_game_per_sport($scope.sport_id)
        //     .then(
        //         function(res){
        //             console.log(res.data);
        //         },
        //         function(err){
        //             console.log(err.data);
        //         });

        // console.log($scope.gps);

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
