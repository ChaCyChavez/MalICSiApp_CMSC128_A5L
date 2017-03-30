'use strict';

(() => {
    angular.module('app')
        .controller('error-404-controller', error_404_controller);

    function error_404_controller($scope, $location) {

        $scope.back_to_home = () => {
            $location.path("/").replace();
        }
    }
})();
