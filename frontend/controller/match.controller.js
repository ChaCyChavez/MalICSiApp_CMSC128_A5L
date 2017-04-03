'use strict';

(() => {
    angular
        .module('app')
        .controller('match-controller', match_controller);

    function match_controller($scope, $location, MatchService) {

        $scope.view_profile = () => {
            window.location.href="#!/profile";
        }
        $scope.view_user = () => {
            window.location.href="#!/user";
        }

        $scope.logout = () => {
            window.location.href="#!/";
        }
        
        $scope.back_to_home = () => {
            window.location.href="#!/game-event";
        }

        let x = $location.path().toString().split("/");
        $scope.match_id = parseInt(x[x.length-1]);
        $scope.match = {
            match_id: 0,
            status: "",
            match_date_time: null,
            series: "",
            court_name: "",
            court_location: "",
            teams: []
        }

        $scope.init_match = () => {
            MatchService
                .init_match($scope.match_id)
                .then(function(res) {
                    console.log(res[0]);
                    $scope.match = res[0][0];
                }, function(err) {
                    console.log(res[0]);
                })
        }
    }
})();
