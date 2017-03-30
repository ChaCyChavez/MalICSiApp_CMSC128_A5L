'use strict';

(() => {
    angular
        .module('app')
        .controller('profile-controller', profile_controller);


    function profile_controller($scope, $location, $routeParams, ProfileService) {
        ProfileService
            .get_profile($routeParams.account_id)
            .then((data) => {
            console.log(data);
            $scope.profile = data[0][0];
        });
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
    profile_controller.$inject = ['$scope', '$location', '$routeParams', 'ProfileService'];
})();
