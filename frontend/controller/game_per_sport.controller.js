'use strict';
/*
localhost:8000/#!/game-per-sport/:sport-id
*/
(() => {
    angular
        .module('app')
        .controller('game-per-sport-controller', game_per_sport_controller);

    function game_per_sport_controller($scope, $location, $routeParams, GamePerSportService, SponsorService, SportsService, SportService) {
        $scope.sprts = [];
        $scope.size = 0;
        $scope.loop = [];
        $scope.name = " ";
        let gamid = $routeParams.game_id;

        $scope.gps = GamePerSportService
            .get_game_per_sport(gamid)
            .then(
                function(res){
                    $scope.sprts = res[0];
                    $scope.name = res[0][0].game_name;
                    $scope.size = res[0].length;
                    $scope.loop = $scope.range($scope.size);
                },
                function(err){
                    console.log(err.data);
                });


        $scope.range = function(size) {
            var ret = [];

            for(var i = 0; i < size; i += 2){
                ret.push(i);
            }

            return ret;
        }

        $scope.init_sponsor = () => {
            SponsorService
            .init_sponsors(gamid)
            .then(function(res) {
                $scope.sponsors = res[0];
            }, function(err) {
                console.log(err.data);
            })
        }

        var get_teams_of_sport = (data, func) =>  {
            SportsService
                .get_teams_sport(data).
                then(function(res) {
                    var arr = res.data[0];
                    func(arr);
                }, function(err) {
                    console.log(err);
                });
        }

         $scope.matches = [];

        $scope.get_sports = () => {
            let data = {
                game_id : gamid
            }
            let ret_sport = [];
            SportsService
                .get_sports_game(data).
                then(function(res) {
                    res.data[0].forEach(function(element){
                        let obj2 = {
                            sport_id: element.sport_id,
                            sport_type: element.sport_type,
                            division: element.division,
                            matches: []
                        };
                        // console.log(obj2);
                        get_matches(obj2);
                        ret_sport.push(obj2);
                    });
                    $scope.sports = ret_sport;

                    console.log($scope.sports)

                }, function(err) {
                    console.log(err);
                });
        }

        var get_matches = (sport) => {
            let data = {
                sport_id: sport.sport_id
            } 
            let ret_match = [];
            SportService
                .get_match(data).
                then(function(res) {
                    let arr = res.data[0];
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
                                        team_id: element.team_id,
                                        team_name: element.team_name,
                                        team_color: element.team_color.toLowerCase()
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
                           match_id:i,
                           date_time: null,
                           court_name: null,
                           teams: []
                        }
                        arr.forEach(function(j){
                            if(j.match_id === i){
                                obj.match_id = j.match_id;
                                obj.date_time = j.match_date_time;
                                obj.court_name = j.court_name;
                                if(!obj.teams.includes(j.team_name)){
                                    j.team_color = j.team_color.toLowerCase();
                                    obj.teams.push(j);
                                }
                            }
                        });
                        matches.push(obj);
                    });
                    sport.matches = matches;
                    $scope.teams = team_list;
                    let BreakException = {};
                    try{
                        matches.forEach(function(j){
                            if(j.teams.length != 2){
                                document.getElementById("tourn-brac").disabled = true;
                                $scope.dis_tourn = true;
                                throw BreakException;
                            }
                        });
                    }catch (e) {
                        if (e !== BreakException) throw e;
                    }        
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.logout = () => {
            window.location.href="#!/";
        }

        $scope.back_to_home = () => {
            window.location.href="#!/";
        }
    }
})();
