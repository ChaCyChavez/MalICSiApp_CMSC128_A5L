'use strict';

(() => {
    angular
        .module('app')
        .controller('sponsor-controller', sponsor_controller);

    function sponsor_controller($scope, $location, SponsorService) {

        $scope.view_profile = () => {
            $location.path("/profile").replace();
        }

        $scope.view_user = () => {
            $location.path("/user").replace();
        }

        $scope.logout = () => {
            $location.path("/").replace();
        }

        $scope.back_to_home = () => {
            $location.path("/game-event").replace();
        }

        $scope.sponsor = {
            sponsor_name: "",
            sponsor_logo: "",
            sponsor_type: "",
            sponsor_desc: "",
            web_address: "",
            game_id: 0
        }

        $scope.add_sponsor = () => {
            var x = $location.path().toString().split("/");

            if ($scope.sponsor.sponsor_name == "" ||
                $scope.sponsor.sponsor_logo == "" ||
                $scope.sponsor.sponsor_type == "" ||
                $scope.sponsor.sponsor_desc == "") {
                Materialize.toast("Please fill up all fields", 4000, 'teal');
                $scope.sponsor = {
                    sponsor_name: "",
                    sponsor_logo: "",
                    sponsor_type: "",
                    sponsor_desc: "",
                    web_address: "",
                    game_id: 0
                }
            }
            else {
                $scope.sponsor.game_id = parseInt(x[x.length-1]);
                SponsorService
                    .add_sponsors($scope.sponsor)
                    .then(function(res) {
                        Materialize.toast(res.message, 4000, 'teal');
                    }, function(err) {
                        Materialize.toast(err.message, 4000, 'teal');
                        $scope.info.username = '';
                        $scope.info.password = '';
                        $scope.info.username = undefined;
                        $scope.info.password = undefined;
                    })
            }
        }
    }
})();
