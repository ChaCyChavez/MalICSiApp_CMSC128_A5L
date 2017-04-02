'use strict';

(() => {
    angular
        .module('app')
        .controller('profile-controller', profile_controller);

    profile_controller.$inject = ['$scope', '$location', '$routeParams', 'ProfileService'];

    function profile_controller($scope, $location, $routeParams, ProfileService) {
        ProfileService
            .get_profile($routeParams.account_id)
                .then((data) => {
                if (data[0].length != 0) {
                    $scope.profile = data[0][0];
                }
            });

        ProfileService
            .get_user_upcoming_events($routeParams.account_id)
            .then((data) => {
            console.log("get_user_upcoming_events", data[0]);
                $scope.user_upcoming_events = data[0];
        });

        ProfileService
            .get_user_past_events($routeParams.account_id)
            .then((data) => {
            console.log("get_user_past_events", data[0]);
                $scope.user_past_events = data[0];
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
