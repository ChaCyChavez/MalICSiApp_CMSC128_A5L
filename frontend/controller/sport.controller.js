'use strict';

(() => {
    angular.module('app')
        .controller('sport-controller', sport_controller);

    sport_controller.$inject = ['$scope', '$location', 'SportService'];

    function sport_controller($scope, $location, SportService) {

        let temp = [];
        temp = $location.path().toString().split("/");
        let sportid = temp[temp.length-1];
        console.log(sportid);

        $scope.view_tournament_bracketing = () => {
            $location.path("/result").replace();
        }

        $scope.view_match = () => {
            $location.path("/match").replace();
        }

        $scope.view_participant = () => {
            $location.path("/participant").replace();
        }

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

        $scope.get_matches = () => {
            let data = {
                sport_id: sportid
            } 
            let ret_match = [];
            SportService
                .get_match(data).
                then(function(res) {
                    let arr = res.data[0];
                    console.log(arr);
                    let matches = [];
                    let teams = [];
                    let match_ids = [];
                    arr.forEach(function(element){
                        if(!match_ids.includes(element.match_id)){
                            match_ids.push(element.match_id);
                        }
                    });

                    match_ids.forEach(function(i){
                        let obj = {
                            ["match_id"]:i,
                            ["date_time"]: null,
                            ["court_name"]: null,
                            ["teams"]: []
                        }
                        arr.forEach(function(j){
                            if(j.match_id === i){
                                obj["match_id"] = j.match_id;
                                obj["date_time"] = j.match_date_time;
                                obj["court_name"] = j.court_name;
                                if(!obj["teams"].includes(j.team_name)){
                                    obj["teams"].push(j.team_name);
                                }
                            }
                        });
                     
                        obj.teams.forEach(function(i){
                            let obj2 = {
                                ["team_name"]: null,
                                ["participants"]: []
                            }   
                            arr.forEach(function(j){
                                if(j.team_name === i){
                                    obj2["team_name"] = i;
                                    let obj3 = {
                                        ["account_id"]: j.account_id,
                                        ["firstname"]: j.firstname,
                                        ["lastname"]: j.lastname
                                    }
                                    obj2["participants"].push(obj3);
                                }
                            });
                            teams.push(obj2);
                        });

                        matches.push(obj);
                    });



                    console.log(matches);
                    console.log(teams);
                    $scope.matches = matches;
                    $scope.teams = teams;
                }, function(err) {
                    console.log(err);
                });
        }

    }
})();
