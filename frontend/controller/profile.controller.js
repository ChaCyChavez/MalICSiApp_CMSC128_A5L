'use strict';

(() => {
    angular
        .module('app')
        .controller('profile-controller', profile_controller);

    function profile_controller($scope, $location, $routeParams, ProfileService) {
        ProfileService
            .get_profile($routeParams.username)
            .then((data) => {
                console.log(data);
                $scope.profile = data[0][0];
            });
        
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
