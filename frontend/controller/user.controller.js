'use strict';

(() => {
<<<<<<< HEAD
    angular.module('app')
=======
    angular
        .module('app')
>>>>>>> pseudo-main-back-end
        .controller('user-controller', user_controller);

    function user_controller($scope, $location) {

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
