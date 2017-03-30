<<<<<<< HEAD
'use strict';

(() => {
    angular.module('app')
        .controller('login-register-controller', login_register_controller);

    function login_register_controller($scope, $location) {
        
        $scope.login = () => {
        		$("#modal-login").modal('close');
        		
            $location.path("/game-event").replace();
        }
    }
=======

'use strict';

(() => {
    angular
    	.module('app')
        .controller('login-register-controller', login_register_controller);

    function login_register_controller($scope, $location, LoginRegisterService) {
        
        $scope.info = {
            username : undefined,
            password : undefined
        }

        $scope.login = () => {
    		LoginRegisterService
                .retrieve_account($scope.info)
                .then(function(res) {
                    $("#modal-login").modal('close');	
                }, function(err) {
                    Materialize.toast(err.message, 4000, 'black');
                })
        }
    }

>>>>>>> pseudo-main-back-end
})();
