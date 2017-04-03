'use strict';

(() => {
    angular
        .module('app')
        .controller('login-register-controller', login_register_controller);

    login_register_controller.$inject = ['$scope', '$location', '$routeParams', '$rootScope', 'ProfileService', 'LoginRegisterService'];

    function login_register_controller($scope, $location, $routeParams, $rootScope, ProfileService, LoginRegisterService) {

	}
})();
