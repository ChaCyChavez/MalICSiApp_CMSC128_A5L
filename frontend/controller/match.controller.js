'use strict';

(() => {
    angular.module('app')
        .controller('match-controller', match_controller);

    function match_controller($scope, $location) {

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
