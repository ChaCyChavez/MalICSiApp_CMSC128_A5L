'use strict';

(() => {
    angular
        .module('app')
        .controller('registered-user-controller', registered_user_controller);

    function registered_user_controller($scope, $location) {

    	$scope.view_profile = () => {
            $location.path("/profile").replace();
        }
        
        $scope.view_user = () => {
            $location.path("/user").replace();
        }

        $scope.logout = () => {
            $location.path("/").replace();
        }
        
        $scope.back_to_home = () => {
            $location.path("/game-event").replace();
        }
    }
})();
