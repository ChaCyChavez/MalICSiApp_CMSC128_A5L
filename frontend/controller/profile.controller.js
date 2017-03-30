'use strict';

(() => {
    angular.module('app')
        .controller('profile-controller', profile_controller);

    function profile_controller($scope, $location, $routeParams) {
		
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
