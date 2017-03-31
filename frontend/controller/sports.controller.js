'use strict';

(() => {
    angular
        .module('app')
        .controller('sports-controller', sports_controller);

    sports_controller.$inject = ['$scope', '$location', 'SportsService'];
    
    function sports_controller($scope, $location, $SportsService) {

        $scope.sports = [];
        $scope.teams = [];

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

        $scope.get_sports = () => {
            SportsService
                .get_sports()
                .then(function(res) {
                    $scope.sports = res[0];
                    console.log($scope.sports);  
                }, function(err) {
                    console.log(err);
                });
        }
        $scope.delete_sport = () => {
            SportsService
                .delete_sport().
                then(function(res) {
                    
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.get_teams = () => {
            SportsService
                .get_teams().
                then(function(res) {
                    $scope.teams = res[0];
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.add_sport = function() {
            
            var to_add = {
                sport_type: $scope.sport_type,
                division: $scope.division
            }  
            
            SportsService
                .add_sport(to_add)
                .then(function(res) {
                    console.log(res);   
                    //$scope.sports = res;
                }, function(err) {
                    console.log(err);
                })
        }

    }
})();
