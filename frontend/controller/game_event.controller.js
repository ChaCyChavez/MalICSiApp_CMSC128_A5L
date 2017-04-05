'use strict';

(() => {
    angular
        .module('app')
        .controller('game-event-controller', game_event_controller);

    game_event_controller.$inject = ['$scope', '$rootScope','$location', 'GameEventService', 'ProfileService'];

    function game_event_controller($scope, $rootScope, $location, GameEventService, ProfileService) {
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
			console.log($scope.teams);
		}

		$scope.add_team = (id) =>{
			for(var i = 0; i < $scope.teams.length; i++){
				$scope.teams[i].game_id = id;
				GameEventService
				.add_team($scope.teams[i])
				.then(function(res) {
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
            window.location.href=$scope.view.type == 'upcoming'? "#!/sponsor/" + $scope.upcoming[$scope.view.id].game_id : "#!/sponsor/" + $scope.current_games[$scope.view.id].game_id;
        	// window.location.reload();
        	//^temporary
        }
        $scope.view_sports = () => {
            window.location.href=$scope.view.type == 'upcoming'? "#!/sports/" + $scope.upcoming[$scope.view.id].game_id : "#!/sports/" + $scope.current_games[$scope.view.id].game_id;
            // window.location.reload();
            // ^temporary
        }

        $scope.view_setup = (gameid, id,type) =>{
        	$scope.view.id = id;
        	$scope.view.type = type;
        	$scope.view.gameid = gameid;

        	console.log(gameid);
        }

        $scope.view_registered_user = () => {
            window.location.href=$scope.view.type == 'upcoming'? "#!/registered-user/" + $scope.upcoming[$scope.view.id].game_id : "#!/registered-user/" + $scope.current_games[$scope.view.id].game_id;
            window.location.reload();
            //^temporary
        }

		$scope.get_current_games = () => {
			GameEventService.get_current_games().then((data) => {
				$scope.current_games = data[0];
			});
		};

		$scope.get_upcoming_games = () => {
			GameEventService
			.get_upcoming_games()
			.then((data) => {
				$scope.upcoming_games = data[0];
			});
		}
		$scope.edit_game_info = {
				game_id: undefined,
				game_starting_time_date: undefined,
				game_ending_time_date: undefined,
				game_name: undefined
			};
		$scope.setup_edit_modal = (type, id) => {
			console.log(type, id);
			if (type === 'upcoming') {
				$scope.edit_game_info =JSON.parse(JSON.stringify($scope.upcoming_games[id]));
				console.log( $scope.edit_game_info);
			} else if (type === 'current') {
				$scope.edit_game_info =JSON.parse(JSON.stringify($scope.current_games[id]));
				console.log( $scope.edit_game_info);

			}
		}

		$scope.edit_game = () => {
			$scope.edit_game_info.game_starting_time_date = $scope.edit_game_info.game_starting_time_date.replace("Z", "");
			$scope.edit_game_info.game_ending_time_date = $scope.edit_game_info.game_ending_time_date.replace("Z", "");
			GameEventService.edit_game($scope.edit_game_info).then((err, data) => {
				console.log(err, data);
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

			GameEventService
				.get_teams(data)
				.then(function(res){
					$scope.teams = res[0];
            	},function(err){
                	console.log(err);
            	})
		}

		$scope.check_if_registered = () => {
			var data = {
				account_id: $rootScope.profile.account_id,
			}

			GameEventService
				.get_team_of_account(data)
				.then(function(res){
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
				account_id: $scope.team.account_id,
				team_id: $scope.team.team_id
			}

			if (data.team_id == undefined) {
				swal("Choose a team.");
			} else {
			GameEventService
				.join_account_to_team(data)
				.then(function(res){
					swal("Successfully joined to team.");
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
				game_starting_time_date: $('#datepicker1').val(),
				game_ending_time_date: $('#datepicker2').val()
			};

			if (data.game_name == "" ||
                data.game_starting_time_date == "" ||
                data.game_ending_time_date == "") {
                swal("Please fill up all fields");
            } else {
				GameEventService
				.add_game(data)
				.then(function(res){
					swal(res.message);
					console.log("INSERT_ID: ", res[0][0]['last_insert_id()']);
					$scope.add_team(res[0][0]['last_insert_id()']);
            	},function(err){
            		swal(res.error);
                	console.log(err);
            	})

			}

			$scope.game_name = "";
           	$('#datepicker1').val('');
           	$('#datepicker2').val('');
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
						$scope.upcoming_games.splice(id, 1);
					});
				} else {
					GameEventService.delete_game({game_id:$scope.current_games[id].game_id}).then((err, data) => {
						$scope.current_games.splice(id, 1);
					});
				}
				Materialize.toast("Successfully deleted.", 4000, 'teal');
				swal("Deleted!", "Event has been deleted.", "success");
			});
		}
    }
})();
