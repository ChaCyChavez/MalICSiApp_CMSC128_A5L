'use strict';

(() => {
<<<<<<< HEAD
    angular.module('app')
=======
    angular
        .module('app')
>>>>>>> pseudo-main-back-end
        .controller('sports-controller', sports_controller);

    function sports_controller($scope, $location) {

        $scope.view_sport = () => {
            $location.path("/sport").replace();
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
