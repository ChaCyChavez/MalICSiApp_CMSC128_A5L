'use strict';

(() => {
    angular
        .module('app')
        .controller('sports-controller', sports_controller);

    sports_controller.$inject = ['$scope', '$rootScope', '$window', '$location', '$routeParams','$interval', 'SportsService', 'GameEventService'];

    function sports_controller($scope, $rootScope, $window, $location, $routeParams, $interval, SportsService, GameEventService) {


        $scope.sports = [];
        $scope.teams = [];
        var gameid = $routeParams.game_id;
        $scope.is_owner = false;

        $scope.ownership_init = () => {
            GameEventService.get_game_event({"game_id": gameid}).then((data) => {
                $scope.is_owner = data[0][0].account_id == $rootScope.profile.account_id;
            });
            
        }

        $scope.sports = [];

        $scope.change_view = (view) => {
            window.location.href= view + gameid;
            $window.location.reload();
        }

        $scope.view_sport = (sport_id) => {
            window.location.href="#!/sport/" + sport_id;
            $window.location.reload();
        }

        $scope.view_profile = () => {
            window.location.href="#!/profile";
            $window.location.reload();
        }

        $scope.view_user = () => {
            window.location.href="#!/user";
            $window.location.reload();
        }

        $scope.logout = () => {
            window.location.href="#!/";
            $window.location.reload();
        }

        $scope.back_to_home = () => {
            window.location.href="#!/game-event";
            $window.location.reload();
        }

        $scope.delete_sport = (index) => {
                var data = {
                    sport_id: $scope.sports[index].sport_id
                }
                swal({
                  type: "warning",
                  title: "Are you sure?",
                  showCancelButton: true,
                  confirmButtonColor: "#DD6B55",
                  confirmButtonText: "Yes, delete it!",
                  closeOnConfirm: true
                },
                function(){
                    SportsService
                        .delete_sport(data).
                        then(function(res) {
                            $scope.sports.splice(index, 1);
                            swal("Deleted!", "Sport has been successfully removed.", "success");
                        }, function(err) {
                            swal(err.message);
                        });

                });
        }

        $scope.edit_sport_info = {};
		$scope.edit_id = -1;
        $scope.setup_edit_modal = (id) => {
            $scope.edit_sport_info= JSON.parse(JSON.stringify($scope.sports[id]));
			$scope.edit_id = id;
        }
        
        $scope.edit_sport = () => {
            SportsService
                .update_sport($scope.edit_sport_info)
                .then(function(res){
					$scope.sports[$scope.edit_id] = $scope.edit_sport_info;
                    swal("Sport has been successfully edited.");
                } , function(err){
                	swal(err.message);
                });
        }
       
        $scope.edit_sport_info = {};
        $scope.edit_id = -1;
        $scope.setup_edit_modal = (id) => {
            $scope.edit_sport_info = JSON.parse(JSON.stringify($scope.sports[id]));
            $scope.edit_id = id;
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
			let data = {
				game_id : gameid
			}
            let ret_sport = [];
            SportsService
                .get_sports_game(data).
                then(function(res) {
			        console.log(res.data[0]);
                	res.data[0].forEach(function(element){
                        let obj2 = {
                            sport_id: element.sport_id,
                            sport_type: element.sport_type,
                            division: element.division,
                            teams: []
                        };
                        get_teams_of_sport(element, function(arr){
                            arr.forEach(function(ob){
                                if(!obj2.teams.includes(ob.team_name)){
                            		obj2.teams.push(ob.team_name);
                                }
                            });

                            if(obj2.teams.length <= 0){
                                obj2.teams.push("No participating teams.");;
                            }
                        });
						ret_sport.push(obj2);
                    });
					$scope.sports = ret_sport;

                }, function(err) {
                    console.log(err);
                });
        }

<<<<<<< HEAD
        /*$interval($scope.get_sports, 5000);*/
=======
>>>>>>> 9b11a3ab6425d35b2cf4184a2eb7fc6e78322d1e
        $scope.add_sport = function() {
            var data = {
                game_id: gameid,
                sport_type: $scope.sport_type,
                division: $scope.division
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
	                    swal(res.message);
	                    document.getElementById("sports-form").reset();
	                }, function(err) {
	                    swal(err.message);
	                })
            }
        }
    }
})();
