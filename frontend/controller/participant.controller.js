'use strict';

(() => {
    angular
        .module('app')
        .controller('participant-controller', participant_controller);

    function participant_controller($scope, $location) {

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
