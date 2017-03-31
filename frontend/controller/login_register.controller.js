
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

        $scope.print = {}

        $scope.data = {
            username: undefined,
            password: undefined,
            fname: undefined,
            mname: undefined,
            lname: undefined,
            college: undefined,
            course: undefined,
            emailadd: undefined,
            is_player: undefined,
            date: undefined
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
            let e = document.getElementById("opt");
            let strUser = e.options[e.selectedIndex].value;
            $scope.data.date = $('.datepicker').val();
            $scope.data.college = strUser;
            $scope.data.is_player = $('#is_player').val();
            console.log($scope.data.is_player);
            if ($scope.data.username === undefined ||
                $scope.data.username === '' ||
                $scope.data.password === undefined ||
                $scope.data.password === '' ||
                $scope.data.fname === undefined ||
                $scope.data.fname === '' ||
                $scope.data.mname === undefined ||
                $scope.data.mname === '' ||
                $scope.data.lname === undefined ||
                $scope.data.lname === '' ||
                $scope.data.college === undefined ||
                $scope.data.college === '' ||
                $scope.data.course === undefined ||
                $scope.data.course === '' ||
                $scope.data.emailadd === undefined ||
                $scope.data.emailadd === '' ||
                $scope.data.date === undefined ||
                $scope.data.date === '' ||
                $scope.data.is_player === undefined ||
                $scope.data.is_player === '') {
                Materialize.toast("Please fill-out all the fields", 4000, 'teal');
                $scope.data.username = '';
                $scope.data.password = '';
                $scope.data.fname = '';
                $scope.data.mname = '';
                $scope.data.lname = '';
                $scope.data.college = '';
                $scope.data.course = '';
                $scope.data.emailadd = '';
                $scope.data.date = '';
            } else {
                LoginRegisterService
                    .register_account($scope.data)
                    .then(function(res) {
                        $("#modal-login").modal('close');   
                    }, function(err) {
                        Materialize.toast(err.message, 4000, 'teal');
                    })
            }
        }
    }

})();
