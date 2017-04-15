'use strict';

(() => {
    angular
        .module('app')
        .controller('game-event-controller', game_event_controller);

    game_event_controller.$inject = ['$scope', '$window', '$rootScope','$location', 'GameEventService', 'ProfileService'];

    function game_event_controller($scope, $window, $rootScope, $location, GameEventService, ProfileService) {
		// fetching is being implemented by other group member

		$scope.current_games = [
			{
				game_id: undefined,
				game_starting_time_date: undefined,
				game_ending_time_date: undefined,
				game_name: undefined
			},
			{
				game_id: undefined,
				game_starting_time_date: undefined,
				game_ending_time_date: undefined,
				game_name: undefined
			},
			{
				game_id: undefined,
				game_starting_time_date: undefined,
				game_ending_time_date: undefined,
				game_name: undefined
			}
		];

		$scope.upcoming_games = [
			{
				game_id: undefined,
				game_starting_time_date: undefined,
				game_ending_time_date: undefined,
				game_name: undefined
			}
		];


		$scope.teams = [
			{
				team_name:undefined,
				team_color: undefined,
				game_id:undefined
			}
		];
		$scope.append_fills = () =>{
			$scope.teams.push(
			{
				team_name:undefined,
				team_color: undefined
			});
			$("#add-game-modal").modal("refresh");
		}

		$scope.add_team = (id) =>{
			for(var i = 0; i < $scope.teams.length; i++){
				$scope.teams[i].game_id = id;
				GameEventService
				.add_team($scope.teams[i])
				.then(function(res) {
					swal("Success!", "Event has been successfully added.", "success");
					console.log(res);
				}, function(err) {
					console.log(err);
				});
			}
		}

		$scope.view = {
				type: undefined,
				id: undefined,
				gameid: undefined

		}

		$scope.team = {
				account_id: undefined,
				team_id: undefined
		}

		


		$scope.view_sponsor = () => {
			$("#modal1").modal('close');
            window.location.href= "#!/sponsor/" + $scope.view.gameid; 
        }
        $scope.view_sports = () => {
            window.location.href= "#!/sports/" +$scope.view.gameid; 
        }

        $scope.view_setup = (gameid, id,type) =>{
        	$scope.view.gameid = gameid;
        	$scope.view.id = id;
        	$scope.view.type = type;
        }

	    $scope.view_registered_user = () => {
	    	$("#modal1").modal('close');
	        window.location.href="#!/registered-user/" + $scope.view.gameid; 
	    }

		$scope.get_current_games = () => {
			GameEventService
			.get_current_games()
			.then((data) => {
				$scope.current_games = data[0];
			});
		};

		$scope.get_upcoming_games = () => {
			GameEventService
			.get_upcoming_games()
			.then((data) => {
				$scope.upcoming_games = data[0];
				console.log(data[0]);
			});
		}
		$scope.edit_game_info = {
				game_id: undefined,
				game_starting_time_date: undefined,
				game_ending_time_date: undefined,
				game_name: undefined
			};

		$scope.edit_id = -1;
		$scope.edit_type = "";
		$scope.setup_edit_modal = (type, id) => {
			$scope.edit_type = type;
			$scope.edit_id = id;
			if (type === 'upcoming') {
				$scope.edit_game_info =JSON.parse(JSON.stringify($scope.upcoming_games[id]));
				$scope.edit_game_info.game_starting_time_date = new Date($scope.edit_game_info.game_starting_time_date);
				$scope.edit_game_info.game_ending_time_date = new Date($scope.edit_game_info.game_ending_time_date);
				console.log($scope.edit_game_info);
			} else if (type === 'current') {
				$scope.edit_game_info =JSON.parse(JSON.stringify($scope.current_games[id]));
				$scope.edit_game_info.game_starting_time_date = new Date($scope.edit_game_info.game_starting_time_date);
				$scope.edit_game_info.game_ending_time_date = new Date($scope.edit_game_info.game_ending_time_date);
				console.log($scope.edit_game_info);

			}
		}

		$scope.edit_game = () => {
			if ($scope.edit_type === "upcoming") {
				$scope.upcoming_games[$scope.edit_id] = $scope.edit_game_info;
			} else if ($scope.edit_type == "current") {
				$scope.current_games[$scope.edit_id] = $scope.edit_game_info;
			}
			$scope.edit_game_info.game_starting_time_date = $('#edit_start_game').val();
			$scope.edit_game_info.game_ending_time_date = $('#edit_end_game').val();
			$scope.edit_game_info.game_starting_time_date = moment($scope.edit_game_info.game_starting_time_date).format("YYYY-MM-DD");
			$scope.edit_game_info.game_ending_time_date = moment($scope.edit_game_info.game_ending_time_date).format("YYYY-MM-DD");
			GameEventService
			.edit_game($scope.edit_game_info)
			.then((data) => {
				swal("Success!", "Event has been edited.", "success");
			}, (err) => {
				swal("Failure!", "You are not the game head of this game event.", "error");
			});
		}

		$scope.select_team = (teamid) => {
			$scope.team.account_id = $rootScope.profile.account_id;
			$scope.team.team_id = teamid;
		}

		$scope.get_teams = () => {
			var data = {
				game_id: $scope.view.gameid
			}
			console.log(data);
			GameEventService
				.get_teams(data)
				.then(function(res){
					$scope.teams = res[0];
					console.log(res[0]);
					console.log("teams");
            	},function(err){
                	console.log(err);
            	})
		}

		$scope.check_if_registered = () => {
			var data = {
				account_id: $rootScope.profile.account_id,
				game_id: $scope.view.gameid
			}

			GameEventService
				.get_team_of_account(data)
				.then(function(res){
					console.log(res[0]);
					if (res[0] == "") {
						$scope.is_registered = true;
					} else {
						$scope.is_registered = false;
					}
            	},function(err){
                	console.log(err);
            	})
		}

		$scope.join_account_to_team = () => {
			var data = {
				account_id: $rootScope.profile.account_id,
				team_id: $scope.team.team_id
			}

			if (data.team_id == undefined) {
				swal("Choose a team.");
			} else {
			GameEventService
				.join_account_to_team(data)
				.then(function(res){
					swal("Success!", "Successfully joined the team.", "success");
					console.log(res);
            	},function(err){
                	console.log(err);
            	})
            }

            $scope.team.account_id = undefined;
			$scope.team.team_id = undefined;
			$('#modal1').modal('close');
		}

		$scope.add_game = () => {
			var data = {
				game_name: $scope.game_name,
				account_id: $rootScope.profile.account_id,
				game_starting_time_date: moment($('#add_start_game').val()).format("YYYY-MM-DD"),
				game_ending_time_date: moment($('#add_end_game').val()).format("YYYY-MM-DD")
			};
			var blank = 1;
			for(var i = 0 ;i < $scope.teams.length; i++){
				if($scope.teams[i].team_name == undefined || $scope.teams[i].team_color == undefined){
					blank = 0;
					break;
				}
			}
			if (data.game_name == undefined ||
                data.game_starting_time_date == "Invalid date" ||
                data.game_ending_time_date == "Invalid date" || blank == 0) {
                swal("Failed","Please fill up all fields","error");
            }
            else if($scope.teams.length < 2){
            	swal("Failed","A game event needs atleast two teams","error");
            } else {
				GameEventService
				.add_game(data)
				.then(function(res){
					$scope.add_team(res[0][0]['last_insert_id()']);
            	},function(err){
            		swal(res.error);
                	console.log(err);
            	})

			}

			$scope.game_name = "";
           	$('#add_start_game').val('');
           	$('#add_end_game').val('');
		}

		$scope.search_game = () =>{
			var data = {
				game_name: $scope.gameSearched
			}

			console.log(data);
            GameEventService
            .search_game(data)
            .then(function(res){
                $scope.allGames = res[0];
                console.log($scope.allGames);
            },function(err){
                console.log(err);
            })
        }

		$scope.delete_game = (type, id) => {
			swal({
			  title: "Are you sure?",
			  text: "You will not be able to recover the event!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "Yes, delete it!",
			  closeOnConfirm: false
			},
			function(){
				if (type === 'upcoming') {
					GameEventService.delete_game({game_id:$scope.upcoming_games[id].game_id}).then((err, data) => {
						swal("Deleted!", "Event has been deleted.", "success");
						$scope.upcoming_games.splice(id, 1);
					}, (err) => {
						swal("Failure!", "You are not the game head of this game event.", "error");
					});
				} else if (type === "current"){
					GameEventService.delete_game({game_id:$scope.current_games[id].game_id}).then((err, data) => {
						swal("Deleted!", "Event has been deleted.", "success");
						$scope.current_games.splice(id, 1);
					}, (err) => {
						swal("Failure!", "You are not the game head of this game event.", "error");
					});
				}

			});
		}
    }
})();
