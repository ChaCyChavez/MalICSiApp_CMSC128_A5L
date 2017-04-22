'use strict';

(() => {
    angular
        .module('app')
        .controller('login-register-controller', login_register_controller);

    login_register_controller.$inject = ['$scope', '$location', '$window', '$routeParams', '$rootScope', 'ProfileService', 'LoginRegisterService'];

    function login_register_controller($scope, $location, $window, $routeParams, $rootScope, ProfileService, LoginRegisterService) {
        $scope.sports_guest = {};

        $scope.get_loggedIn = () => {
            ProfileService
            .get_profile()
                .then((data) => {
                if (data[0].length != 0)
                {
                    $window.location.href = "#!/game-event";
                } else {
                    $window.location.href = "#!/"
                }
            });
        }

       $scope.get_currGames = () => {
            LoginRegisterService
            .get_currGames().then((data) => {
                $scope.current_games = data[0];
            });
        }

        $scope.init_sports = (gameid) => {
             $("#view-sports-modal").modal("refresh");

            LoginRegisterService
            .get_sports(gameid).then((data) => {
                $scope.sports_guest = data[0];
                $("#view-sports-modal")
                .modal({
                    onVisible: function () {
                        $("#view-sports-modal").modal("refresh");
                    }
                })
                .modal("show");
            });
        }

        $scope.view_sport = (sportid) => {
            window.location.href = "#!/game-per-sport/" + sportid;
            $("#view-sports-modal").modal("hide");

        }
    }
})();
