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

        // $scope.elimination_matches = [];
        // $scope.semis_matches = [];
        // $scope.finals_matches = [];

        $scope.teams = [];

        let sportid = $routeParams.sport_id;

        // $scope.init_elimination_matches = () => {
        //     var data = {
        //         sport_id: sportid
        //     }          
        //     ResultService 
        //         .init_elimination(data)
        //         .then(function(res) {
        //             for(var i=0; i<res[0].length; i+=2) {
        //               $scope.elimination_matches.push({
        //                 player1: res[0][i],
        //                 player2: res[0][i+1]
        //               })
        //             }
        //         }, function(err) {
        //             console.log(err.data);
        //         })
        // }

        // $scope.init_semis_matches = () => {
        //     var data = {
        //         sport_id: sportid
        //     }              
        //     ResultService
        //         .init_semis(data)
        //         .then(function(res) {
        //           for(var i=0; i<res[0].length; i+=2) {
        //             $scope.semis_matches.push({
        //               player1: res[0][i],
        //               player2: res[0][i+1]
        //             })
        //           }
        //         }, function(err) {
        //             console.log(err.data);
        //         })
        // }

        // $scope.init_finals_matches = () => {
        //     var data = {
        //         sport_id: sportid
        //     }              
        //     ResultService
        //         .init_finals(data)
        //         .then(function(res) {
        //           for(var i=0; i<res[0].length; i+=2) {
        //             $scope.finals_matches.push({
        //               player1: res[0][i],
        //               player2: res[0][i+1]
        //             })
        //           }
        //         }, function(err) {
        //             console.log(err.data);
        //         })
        // }

        $scope.init_matches = () => {
            let teams = {};
            let matches = [];            
            var data = {
                sport_id: sportid
            }              
            ResultService
                .init_matches(data)
                .then(function(res) {
                    for(var i=0; i<res[0].length; i+=2) {
                        matches.push({
                            player1: res[0][i],
                            player2: res[0][i+1]
                        })
                        teams[res[0][i].team_name] = {
                            "id": res[0][i].team_id,
                            "name": res[0][i].team_name,
                            "win": 0,
                            "loss": 0,
                            "draw": 0
                        };
                        teams[res[0][i+1].team_name] = {
                            "id": res[0][i+1].team_id,
                            "name": res[0][i+1].team_name,
                            "win": 0,
                            "loss": 0,
                            "draw": 0
                        };
                    }   
                    matches.forEach(function(match){
                        let winner = null;
                        if(match.player1.score > match.player2.score){
                            teams[match.player2.team_name].loss += 1;
                            teams[match.player1.team_name].win += 1;
                        }else if(match.player1.score < match.player2.score){
                            teams[match.player1.team_name].loss += 1;
                            teams[match.player2.team_name].win += 1;
                        }else{
                            teams[match.player2.team_name].draw += 1;
                            teams[match.player1.team_name].draw += 1;
                        }
                    })
                    for (var property in teams) {
                        if (teams.hasOwnProperty(property)) {
                            $scope.teams.push(teams[property]);
                        }
                    }
                    $scope.teams.sort(function(a, b) {return parseFloat(b.win - b.loss) - parseFloat(a.win - a.loss);});                    
                }, function(err) {
                    console.log(err.data);
                })
        }

        $scope.init_all_matches = () => {
            if($window.sessionStorage.profile == "undefined"){
                window.location.href="#!/";
                return;
            }
          // $scope.init_elimination_matches();
          // $scope.init_semis_matches();
          // $scope.init_finals_matches();
          // console.log($scope.finals_matches);
          // console.log($scope.semis_matches);
          // console.log($scope.elimination_matches);          
          $scope.init_matches();
          console.log($scope.teams);          
        }

        $scope.sortType = "name";
        $scope.sortReverse = false;

    }
})();
