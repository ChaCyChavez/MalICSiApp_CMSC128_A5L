'use strict';

(() => {
    angular
        .module('app')
        .controller('game-event-controller', game_event_controller);
        
    game_event_controller.$inject = ['$scope', '$location', 'GameEventService', 'ProfileService'];
    
    function game_event_controller($scope, $location, GameEventService, ProfileService) {

        ProfileService
        .get_profile()
            .then((data) => {
            if (data[0].length != 0) {
                $scope.profile = data[0][0];
            }
        });

        $scope.view_sports = () => {
            $("#modal1").modal('close');
            window.location.href = "#!/sports";
        }

        $scope.view_profile = () => {
            window.location.href = "#!/profile";
        }

        $scope.view_user = () => {
            window.location.href = "#!/user";
        }

        $scope.logout = () => {
            window.location.href = "#!/";
        }

        $scope.view_registered_user = () => {
            $("#modal1").modal('close');
            window.location.href = "#!/registered-user";
        }

        $scope.view_sponsor = (game_id) => {
            $("#modal1").modal('close');
            window.location.href = "#!/sponsor/" + game_id;
        }

        $scope.back_to_home = () => {
            window.location.href = "#!/game-event";
        }
    }
})();
