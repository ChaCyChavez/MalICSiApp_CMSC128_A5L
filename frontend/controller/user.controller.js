'use strict';

(() => {
    angular
        .module('app')
        .controller('user-controller', user_controller);

    function user_controller($scope, $location, UserService) {

        $scope.accounts = [];

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

        $scope.get_accounts = () => {
            UserService
                .get_all_account()
                .then(function(res) {
                    $scope.accounts = res[0];
                    console.log($scope.accounts);
                }, function(err) {
                    console.log(err);
                });
        }
    }
})();
