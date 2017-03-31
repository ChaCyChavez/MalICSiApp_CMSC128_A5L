'use strict';

(() => {
    angular.module('app')
        .controller('sports-controller', sports_controller);

    function sports_controller($scope, $location, $SportsService) {

        $scope.sports = [];

        $scope.view_sport = () => {
            $location.path("/sport").replace();
        }

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

        $scope.get_sports = function() {
            SportsService
                .get_sports()
                .then(function(res) {
                    console.log(res);   
                    $scope.sports = res;
                }, function(err) {
                    console.log(err);
                })
        }
    }
})();
