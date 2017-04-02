'use strict';

(() => {
    angular
        .module('app')
        .controller('user-controller', user_controller);

    function user_controller($scope, $location, UserService) {

        $scope.accounts = [];

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
