'use strict';

(() => {
    angular
        .module('app')
        .controller('registered-user-controller', registered_user_controller);

    function registered_user_controller($scope, $location) {

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
