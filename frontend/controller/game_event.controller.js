'use strict';

(() => {
<<<<<<< HEAD
    angular.module('app')
        .controller('game-event-controller', game_event_controller);

    function game_event_controller($scope, $location) {
=======
    angular
        .module('app')
        .controller('game-event-controller', game_event_controller);
        
    game_event_controller.$inject = ['$scope', '$location', 'GameEventService'];
    
    function game_event_controller($scope, $location, GameEventService) {
>>>>>>> pseudo-main-back-end

        $scope.view_sports = () => {
            $("#modal1").modal('close');
            $location.path("/sports").replace();
        }

        $scope.view_profile = () => {
            $location.path("/profile").replace();
        }

        $scope.logout = () => {
            $location.path("/").replace();
        }

        $scope.view_registered_user = () => {
            $("#modal1").modal('close');
            $location.path("/registered-user").replace();
        }

        $scope.view_sponsor = () => {
            $("#modal1").modal('close');
            $location.path("/sponsor").replace();
        }

        $scope.back_to_home = () => {
            $location.path("/game-event").replace();
        }
    }
})();
