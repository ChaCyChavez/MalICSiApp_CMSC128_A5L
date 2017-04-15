'use strict';
 
(() => {
    angular
        .module('app')
        .controller('sport-controller', sport_controller);

    sport_controller.$inject = ['$scope', '$location', '$routeParams', 'SportService'];

    function sport_controller($scope, $location, $routeParams, SportService) {

        var sportid = $routeParams.sport_id;
        $scope.sportid = $routeParams.sport_id;

        $scope.view_tournament_bracketing = (sport_id) => {
            window.location.href="#!/result/" + sport_id;
        }

        $scope.view_match = (match_id) => {
            window.location.href="#!/match/" + match_id;
        }
        $scope.view_user = () => {
            window.location.href="#!/user";
        }

        $scope.view_participant = () => {
            window.location.href="#!/participant";
        }

        $scope.view_profile = () => {
            window.location.href="#!/profile";
        }

        $scope.view_team = (team_id) => {
            window.location.href="#!/team/" + team_id;
        }

        $scope.logout = () => {
            window.location.href="#!/";
        }

        $scope.back_to_home = () => {
            window.location.href="#!/game-event";
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
                    let team_list = [];
                    let match_ids = [];
                    arr.forEach(function(element){
                        if(!match_ids.includes(element.match_id)){
                            match_ids.push(element.match_id);
                        }
                        if(!teams.includes(element.team_name)){
                            teams.push(element.team_name);
                        }                        
                    });
                    teams.forEach(function(teamname){
                        let BreakException = {};
                        try{
                            arr.forEach(function(element){

                                if(teamname === element.team_name){
                                    let ob = {
                                        ["team_id"]: element.team_id,
                                        ["team_name"]: element.team_name
                                    }
                                    team_list.push(ob);
                                    throw BreakException;
                                }                      
                            }); 
                        }catch (e) {
                            if (e !== BreakException) throw e;
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
                        matches.push(obj);
                    });
                    console.log(matches);
                    console.log(team_list);
                    $scope.matches = matches;
                    $scope.teams = team_list;
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.get_courts = () => {
            SportService
            .get_court()
            .then(function(res){
                console.log(res);
                console.log("res above");
            }, function(err){
                console.log(err);
            });

        }

        $scope.add_match = () => {
            var selectedValues = [];    
            $("#teamJoin :selected").each(function(){
                selectedValues.push($(this).val()); 
            });
            console.log($("#courtJoin").val());
            console.log(selectedValues);
        }                                

    }
})();
