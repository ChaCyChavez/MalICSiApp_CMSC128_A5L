'use strict';

(() => {
    angular
        .module('app')
        .controller('sports-controller', sports_controller);

    function sports_controller($scope, $location) {

        $scope.view_sport = () => {
            window.location.href="#!/sport";
        }

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
    }
})();
