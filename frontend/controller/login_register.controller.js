
'use strict';

(() => {
    angular
    	.module('app')
        .controller('login-register-controller', login_register_controller);

    login_register_controller.$inject = ['$scope', '$location', 'LoginRegisterService'];

    function login_register_controller($scope, $location, LoginRegisterService) {
         
        $scope.info = {
            username : undefined,
            password : undefined
        }

        $scope.data = {
            
        }

        $scope.login = () => {
            if ($scope.info.username === undefined ||
                $scope.info.username === '' ||
                $scope.info.password === undefined ||
                $scope.info.password === '') {
                Materialize.toast("Please fill-out all the fields", 4000, 'teal');
                $scope.info.username = '';
                $scope.info.password = '';
                $scope.info.username = undefined;
                $scope.info.password = undefined;
            } else {
        		LoginRegisterService
                    .retrieve_account($scope.info)
                    .then(function(res) {
                        $("#modal-login").modal('close');	
                    }, function(err) {
                        Materialize.toast(err.message, 4000, 'teal');
                        $scope.info.username = '';
                        $scope.info.password = '';
                        $scope.info.username = undefined;
                        $scope.info.password = undefined;
                    })
            }
        }

        $scope.register = () => {
            if ($scope.info.username === undefined ||
                $scope.info.username === '' ||
                $scope.info.password === undefined ||
                $scope.info.password === '') {
                Materialize.toast("Please fill-out all the fields", 4000, 'teal');
                $scope.info.username = '';
                $scope.info.password = '';
            } else {
                LoginRegisterService
                    .retrieve_account($scope.info)
                    .then(function(res) {
                        $("#modal-login").modal('close');   
                    }, function(err) {
                        Materialize.toast(err.message, 4000, 'teal');
                    })
            }
        }
    }

})();
