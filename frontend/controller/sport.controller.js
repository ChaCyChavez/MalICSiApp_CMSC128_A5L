'use strict';

(() => {
    angular.module('app')
        .controller('sport-controller', sport_controller);

    function sport_controller($scope, $location) {

        $scope.view_tournament_bracketing = () => {
            $location.path("/result").replace();
        }

        $scope.view_match = () => {
            $location.path("/match").replace();
        }

        $scope.view_participant = () => {
            $location.path("/participant").replace();
        }

        $scope.view_profile = () => {
            $location.path("/profile").replace();
        }

        $scope.logout = () => {
            $location.path("/").replace();
        }

        $scope.back_to_home = () => {
            $location.path("/game-event").replace();
        }
    }
})();
