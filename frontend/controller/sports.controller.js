'use strict';

(() => {
    angular
        .module('app')
        .controller('sports-controller', sports_controller);

    sports_controller.$inject = ['$scope', '$location', '$routeParams','$interval', 'SportsService'];

    function sports_controller($scope, $location, $routeParams, $interval, SportsService) {

        $scope.sports = [];
        $scope.edit_sport_info = {};
        var gameid = $routeParams.game_id;

        $scope.sports = [
            {
                sport_id: undefined,
                sport_type: undefined,
                division: undefined 
            }
        ];

        $scope.view_sport = (sport_id) => {
            window.location.href="#!/sport/" + sport_id;
        }

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

        $scope.delete_sport = (sportid, index) => {
                var data = {
                    sport_id: sportid
                }  

                swal({
                  title: "Are you sure?",
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
                            $scope.sports.splice(index, 1);
                            swal("Deleted!", "Sport has been successfully removed.", "success");
                        }, function(err) {  
                            console.log(err);
                        });
                        
                }); 
        }

        //$scope.get_sports();
        $scope.edit_sport_info = {};
        
        $scope.setup_edit_modal = (sport) => {
            $scope.edit_sport_info.sport_type = sport.sport_type;
            $scope.edit_sport_info.division = sport.division;
            $scope.edit_sport_info.sport_id= sport.sport_id;
            console.log($scope.edit_sport_info);
        }

        $scope.edit_sport = () => {
            SportsService
                .update_sport($scope.edit_sport_info)
                .then(function(res){
                    console.log(res);
                    swal("Sport has been successfully edited.");
                } , function(err){
                	swal("Error");
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
                            ["sport_id"]: element.sport_id,
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

        $interval($scope.get_sports, 5000);
        $scope.add_sport = function() {
            var data = {
                sport_type: $scope.sport_type,
                division: $scope.division,
                game_id: gameid
            }  
            
            if ($scope.sport_type == undefined ||
                $scope.division == null) {
                swal("Please fill up all fields");
	            $scope.sport_type = undefined;
		       	$scope.division = null;
            } else {
	            SportsService
	                .add_sport(data)
	                .then(function(res) {
	                    console.log(res);  
	                    swal(res.message);
	                    document.getElementById("sports-form").reset(); 
	                }, function(err) {
	                    swal(res.error);
	                    console.log(err);
	                })
            } 
        }
    }
})();
