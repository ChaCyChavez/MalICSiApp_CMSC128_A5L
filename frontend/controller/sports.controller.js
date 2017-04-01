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

        $scope.get_sports = () => {
            var data = {
                game_id: gameid
            } 
            var ret_sport = [];
            SportsService
                .get_sports_game(data).
                then(function(res) {
                    var sports = res.data[0];
                    sports.forEach(function(element){
                        console.log(element);
                        var obj2 = {
                            ["sport_type"]: element.sport_type,
                            ["division"]: element.division,
                            ["teams"]: []
                        };
                        get_teams_of_sport(element, function(arr){
                            arr.forEach(function(ob){
                                if(!obj2["teams"].includes(ob.team_name)){
                                    obj2["teams"].push(ob.team_name);
                                }                               
                            });
                            console.log(obj2["teams"].length);
                            if(obj2["teams"].length <= 0){
                                obj2["teams"].push("No participating teams.");;
                            }                            
                            ret_sport.push(obj2);
                        });                        
                    });
                    $scope.sports = ret_sport;
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
                    swal("Success!", "You added a sport!", "success");
                    $('#AddSport').modal('close');
                    $scope.sport_type = "";
                    $scope.division = "";
                    document.getElementById("sports-form").reset(); 
                }, function(err) {
                    swal("Error!", "Please check the fields.", "error");
                    console.log(err);
                })
        }
    }
})();
