'use strict';

(() => {
    angular
        .module('app')
        .controller('result-controller', result_controller);

    function result_controller($scope, $window, $location, $routeParams, ResultService) {
      let data = [];
    	$scope.view_profile = () => {
            window.location.href="#!/profile";
        }

        $scope.view_user = () => {
            window.location.href="#!/user";
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


        $scope.teams = [];

        let sportid = $routeParams.sport_id;


        $scope.init_matches = () => {
            let teams = {};
            let matches = {};            
            var data = {
                sport_id: sportid
            }              
            ResultService
                .init_matches(data)
                .then(function(res) {
                    for(var i=0; i<res[0].length; i++) {
                        if(!matches[res[0][i].match_id]){
                            matches[res[0][i].match_id] = {};
                        }
                        if(!matches[res[0][i].match_id].players){    
                            matches[res[0][i].match_id].players = []
                        }
                        matches[res[0][i].match_id].players.push(res[0][i]);

                        teams[res[0][i].team_name] = {
                            "id": res[0][i].team_id,
                            "name": res[0][i].team_name,
                            "win": 0,
                            "loss": 0,
                            "draw": 0
                        };
                    } 
                     
                    for (var property in matches) {
                        if (matches.hasOwnProperty(property)) {
                            let tms = matches[property].players;
                            let winner = tms[0];
                            let draw = true;
                            teams[winner.team_name].loss += 1;
                            for(let i=1; i<tms.length; i++) {
                                teams[tms[i].team_name].loss += 1;
                                if(tms[i-1].score < tms[i].score){
                                    winner = tms[i];
                                }
                                if(tms[i-1].score != tms[i].score){
                                    draw = false;
                                }
                            }
                            if(!draw){
                                teams[winner.team_name].win += 1;
                                teams[winner.team_name].loss -= 1;
                            }else{
                                for(let i=0; i<tms.length; i++) {
                                    teams[tms[i].team_name].loss -= 1;
                                    teams[tms[i].team_name].draw += 1;
                                }                                
                            }
                        }
                    }       
                    console.log(teams);              
                    for (var property in teams) {
                        if (teams.hasOwnProperty(property)) {
                            $scope.teams.push(teams[property]);
                        }
                    }
                    $scope.teams.sort(function(a, b) {return parseFloat(b.win - b.loss) - parseFloat(a.win - a.loss);});                    
                    console.log($scope.teams); 
                }, function(err) {
                    console.log(err.data);
                })
        }

        $scope.init_all_matches = () => {        
          $scope.init_matches();         
        }

        $scope.sortType = "name";
        $scope.sortReverse = false;

    }
})();
