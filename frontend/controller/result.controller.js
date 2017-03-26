'use strict';

(() => {
    angular.module('app')
        .controller('result-controller', result_controller);

    function result_controller($scope, $location) {

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
