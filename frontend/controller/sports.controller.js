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


        $scope.delete_sport = (sportid, index) => {
            console.log(sportid);
                var data = {
                    sport_id: sportid
                }  
                swal({
                  title: "Are you sure?",
                  text: "You will not be able to recover this imaginary file!",
                  type: "warning",
                  showCancelButton: true,
                  confirmButtonColor: "#DD6B55",
                  confirmButtonText: "Yes, delete it!",
                  closeOnConfirm: false
                },
                function(){
                    SportsService
                        .delete_sport(data).
                        then(function(res) {
                            $scope.matches.splice(index, 1);
                        }, function(err) {  
                            console.log(err);
                        });
                        swal("Deleted!", "Your imaginary file has been deleted.", "success");
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
                    var matches = [];
                    for (var i = 0; i < resData.length; i++) {
                        if (!obj[resData[i].match_id]) {
                            obj[resData[i].match_id] = 1;
                        } else if (obj[resData[i].match_id]) {
                            obj[resData[i].match_id] += 1;
                        }
                    }
                    for (var property in obj) {
                        var obj2 = {
                            ["sport_type"]: null,
                            ["match_id"]: property,
                            ["teams"]: []
                        };
                        if (obj.hasOwnProperty(property)) {
                            resData.forEach(function(element){
                                if(obj2["match_id"] == element.match_id){
                                    obj2["teams"].push(element.team_name);
                                    obj2["sport_type"] = element.sport_type;
                                }
                            });
                        }
                        matches.push(obj2);
                    }
                    $scope.matches = matches;
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.add_sport = function() {
            
            var to_add = {
                sport_type: $scope.sport_type,
                division: $scope.division
            }  
            
            SportsService
                .add_sport(to_add)
                .then(function(res) {
                    console.log(res);   
                    //$scope.sports = res;
                }, function(err) {
                    console.log(err);
                })
        }

        

    }
})();
