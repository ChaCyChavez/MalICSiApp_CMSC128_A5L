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

        var x = $location.path().toString().split("/");
        $scope.sponsors = [];
        $scope.game_id = parseInt(x[x.length-1]);


        $scope.init_sponsor = () => {
            SponsorService
                .init_sponsors($scope.game_id)
                .then(function(res) {
                    console.log(res[0]);
                    $scope.sponsors = res[0];
                }, function(err) {
                    console.log(err.data);
                })
        }

        $scope.sponsor = {
            sponsor_name: "",
            sponsor_logo: "",
            sponsor_type: "",
            sponsor_desc: "",
            web_address: "",
            game_id: 0
        }

        $scope.init_edit_modal = (sponsor_id) => {
            for(var i = 0; i < $scope.sponsors.length; i++) {
                if($scope.sponsors[i].sponsor_id === sponsor_id) {
                    console.log($scope.sponsors[i].sponsor_id);
                    $scope.sponsor = $scope.sponsors[i];
                    console.log($scope.sponsor);
                }
            }
        }

        $scope.update_sponsor = () => {
            $scope.sponsor.game_id = parseInt(x[x.length-1]);
                SponsorService
                    .update_sponsors($scope.sponsor)
                    .then(function(res) {
                        Materialize.toast(res.message, 4000, 'teal');
                        $scope.sponsor = {
                            sponsor_name: "",
                            sponsor_logo: "",
                            sponsor_type: "",
                            sponsor_desc: "",
                            web_address: "",
                            game_id: 0
                        }
                    }, function(err) {
                        Materialize.toast(err.message, 4000, 'teal');
                        $scope.sponsor = {
                            sponsor_name: "",
                            sponsor_logo: "",
                            sponsor_type: "",
                            sponsor_desc: "",
                            web_address: "",
                            game_id: 0
                        }
                    })
        }

        $scope.delete_sponsor = (sponsorid) => {
                SponsorService
                    .delete_sponsors({sponsor_id: sponsorid})
                    .then(function(res) {
                        Materialize.toast(res.message, 4000, 'teal');
                        for(var i = 0; i < $scope.sponsors.length; i++) {
                            if($scope.sponsors[i].sponsor_id == sponsorid) {
                                $scope.sponsors.splice(i, 1);
                            }
                        }
                    }, function(err) {
                        Materialize.toast(err.message, 4000, 'teal');
                        
                    });
        }

        $scope.add_sponsor = () => {
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
                        $scope.sponsors.push($scope.sponsor);
                        $scope.sponsor = {
                            sponsor_name: "",
                            sponsor_logo: "",
                            sponsor_type: "",
                            sponsor_desc: "",
                            web_address: "",
                            game_id: 0
                        }
                    }, function(err) {
                        Materialize.toast(err.message, 4000, 'teal');
                        $scope.sponsor = {
                            sponsor_name: "",
                            sponsor_logo: "",
                            sponsor_type: "",
                            sponsor_desc: "",
                            web_address: "",
                            game_id: 0
                        }
                    })
            }
        }
    }
})();
