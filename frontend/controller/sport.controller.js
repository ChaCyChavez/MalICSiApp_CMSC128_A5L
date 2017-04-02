'use strict';

(() => {
    angular
        .module('app')
        .controller('sport-controller', sport_controller);

    function sport_controller($scope, $location) {

        $scope.view_tournament_bracketing = () => {
            window.location.href="#!/result";
        }

        $scope.view_match = () => {
            window.location.href="#!/match";
        }
        $scope.view_user = () => {
            window.location.href="#!/user";
        }

        $scope.view_participant = () => {
            window.location.href="#!/participant";
        }

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
