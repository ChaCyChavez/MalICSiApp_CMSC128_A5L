'use strict';

(() => {
    angular
        .module('app')
        .controller('sports-controller', sports_controller);

    sports_controller.$inject = ['$scope', '$location', 'SportsService'];
    
    function sports_controller($scope, $location, SportsService) {

        $scope.sports = [];
        $scope.teams = [];
        var temp = [];
        temp = $location.path().toString().split("/");
        var gameid = temp[temp.length-1];
        // console.log(gameid);

        $scope.view_sport = () => {
            $location.path("/sport").replace();
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

        $scope.get_sports = () => {
            SportsService
                .get_sports()
                .then(function(res) {
                    $scope.sports = res[0];
                    console.log($scope.sports);  
                }, function(err) {
                    console.log(err);
                });
        }


        $scope.delete_sport = () => {
            SportsService
                .delete_sport().
                then(function(res) {
                    
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.get_teams = () => {
            var data = {
                game_id: gameid
            }  
            SportsService
                .get_teams(data).
                then(function(res) {
                    var resData = res.data[0], obj = {};
                    var sports = [];
                    for (var i = 0; i < resData.length; i++) {
                        if (!obj[resData[i].sport_type]) {
                            obj[resData[i].sport_type] = 1;
                        } else if (obj[resData[i].sport_type]) {
                            obj[resData[i].sport_type] += 1;
                        }
                    }
                    for (var property in obj) {
                        var obj2 = {
                            ["sport_type"]: property,
                            ["teams"]: []
                        };
                        if (obj.hasOwnProperty(property)) {
                            resData.forEach(function(element){
                                if(obj2["sport_type"] == element.sport_type && 
                                    !obj2["teams"].includes(element.team_name)){
                                    obj2["teams"].push(element.team_name);
                                }
                            });
                        }
                        sports.push(obj2);
                    }
                    $scope.sports = sports;
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.add_sport = function() {
            
            var data = {
                sport_type: $scope.sport_type,
                division: $scope.division,
                game_id: gameid
            }  
            
            SportsService
                .add_sport(data)
                .then(function(res) {
                    console.log(res);   
                    //$scope.sports = res;
                }, function(err) {
                    console.log(err);
                })
        }
    }
})();
