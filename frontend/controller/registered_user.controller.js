'use strict';

(() => {
<<<<<<< HEAD
    angular.module('app')
=======
    angular
        .module('app')
>>>>>>> pseudo-main-back-end
        .controller('registered-user-controller', registered_user_controller);

    function registered_user_controller($scope, $location) {

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
