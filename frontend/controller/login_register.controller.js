'use strict';

(() => {
    angular
        .module('app')
        .controller('login-register-controller', login_register_controller);

    function login_register_controller($scope, $location, $window, $routeParams, $rootScope, ProfileService, LoginRegisterService) {
        $scope.sports_guest = {};


       $scope.get_currGames = () => {
            if($window.sessionStorage.profile != "undefined"){
                window.location.href="#!/game-event";
                return;
            }
            LoginRegisterService
            .get_currGames().then((data) => {
                $scope.current_games = data[0];
            });
        }

        $scope.view_sports_guest = (gameid) => {
            window.location.href = "#!/game-per-sport/" + gameid;
        }

        $scope.view_sport = (sportid) => {
            window.location.href = "#!/game-per-sport/" + sportid;
            $("#view-sports-modal").modal("hide");

        }
    }
})();
