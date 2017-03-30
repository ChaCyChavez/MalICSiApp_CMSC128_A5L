'use strict';

(() => {
<<<<<<< HEAD
    angular.module('app')
        .controller('profile-controller', profile_controller);

    function profile_controller($scope, $location) {

    	$scope.view_profile = () => {
=======
    angular
        .module('app')
        .controller('profile-controller', profile_controller);

    function profile_controller($scope, $location, $routeParams, ProfileService) {
        ProfileService
            .get_profile($routeParams.account_id)
            .then((data) => {
            console.log(data);
            $scope.profile = data[0][0];
        });
        
        $scope.view_profile = () => {
>>>>>>> pseudo-main-back-end
            $location.path("/profile").replace();
        }

        $scope.logout = () => {
            $location.path("/").replace();
        }
<<<<<<< HEAD
        
=======

>>>>>>> pseudo-main-back-end
        $scope.back_to_home = () => {
            $location.path("/game-event").replace();
        }
    }
<<<<<<< HEAD
=======
    profile_controller.$inject = ['$scope', '$location', '$routeParams', 'ProfileService'];
>>>>>>> pseudo-main-back-end
})();
