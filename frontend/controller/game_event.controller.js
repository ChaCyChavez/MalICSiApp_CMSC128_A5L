'use strict';

(() => {
    angular
        .module('app')
        .controller('game-event-controller', game_event_controller);

    game_event_controller.$inject = ['$scope', '$window', '$rootScope','$location', 'GameEventService', 'ProfileService'];

    function game_event_controller($scope, $window, $rootScope, $location, GameEventService, ProfileService) {
		$scope.current_games = [];
		$scope.upcoming_games = [];
    	$scope.past_games = [];
		$scope.teams = [];

		$scope.ngRepeatFinished = () => {
			//http://stackoverflow.com/questions/24437658/angular-ng-if-how-to-callback-after-ng-if-template-has-been-rendered
			setTimeout(() => {
				$('.special.cards .image').dimmer({
                on: 'hover'
				});

				$('.ui.dropdown').dropdown();

				$("#add-game").click(function() {
					$('#add-game-modal').modal({
					onShow: function(){
						$('#start-date').calendar({
						type: 'date'
						});
						$('#end-date').calendar({
						type: 'date'
						});
					}
					}).modal('show');
				});

				$("#remove-game").click(function() {
					$("#remove-game-modal").modal("show");
				});

				$("#rttg").click(function() {
					$("#choose-team-modal").modal("show");
				});

				$(".edit-game").click(function() {
					$("#edit-game-modal").modal({
					onShow: function() {
						$('#edit-start-date').calendar({
						type: 'date'
						});

						$('#edit-end-date').calendar({
						type: 'date'
						});
					}
					}).modal("show");
				});

				$(".view-more").click(function() {
					$("#view-more-modal").modal("show");
				});

				$('.modal-close').click(function() {
					$('.ui.modal').modal('hide');
				});

				$('.ui.radio.checkbox').checkbox();

				$('.reg-to-game').click(function() {
					$('#choose-team-modal').modal("show");
				});
			},0);
		};

		$scope.append_fills = () =>{
			$scope.teams.push(
			{
				team_name:undefined,
				team_color: $scope.random_color()
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
				}, function(err) {
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
            window.location.reload();
        }

        $scope.view_per_game_sponsors = (game_id) => {
			$("#recognize-sponsor-modal").modal("show");
			console.log(game_id);

            //window.location.href= "#!/sponsor/" + $scope.view.gameid;
            //window.location.reload();
        }

        $scope.view_sports = () => {
            window.location.href= "#!/sports/" +$scope.view.gameid;
        }

        $scope.view_setup = (gameid, id,type) =>{
        	$scope.view.gameid = gameid;
        	$scope.view.id = id;
        	$scope.view.type = type;
        }

	    $scope.view_participant = () => {
	    	$("#modal1").modal('close');
	        window.location.href= "#!/participant/" + $scope.view.gameid;
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
			});
		}

    $scope.get_past_games = () => {
      GameEventService
      .get_past_games()
      .then((data) => {
        $scope.past_games = data[0];
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
			} else if (type === 'current') {
				$scope.edit_game_info =JSON.parse(JSON.stringify($scope.current_games[id]));
				$scope.edit_game_info.game_starting_time_date = new Date($scope.edit_game_info.game_starting_time_date);
				$scope.edit_game_info.game_ending_time_date = new Date($scope.edit_game_info.game_ending_time_date);
			}
		}

		$scope.edit_game = () => {
			$scope.edit_game_info.game_starting_time_date = $('#edit_start_game').val();
			$scope.edit_game_info.game_ending_time_date = $('#edit_end_game').val();
			$scope.edit_game_info.game_starting_time_date = moment($scope.edit_game_info.game_starting_time_date).format("YYYY-MM-DD");
			$scope.edit_game_info.game_ending_time_date = moment($scope.edit_game_info.game_ending_time_date).format("YYYY-MM-DD");
			if (!moment($scope.edit_game_info.game_ending_time_date).isAfter($scope.edit_game_info.game_starting_time_date)) {
				swal("Failed","Ending date precedes starting date.","error");
				return;
			}
			if($scope.edit_game_info.game_starting_time_date == undefined || $scope.edit_game_info.game_ending_time_date == undefined ||
				$scope.edit_game_info.game_name == undefined){
				swal("Failure!", "Please fill out all fields", "error");
			}else{
				GameEventService
				.edit_game($scope.edit_game_info)
				.then((data) => {
					swal({title: "Success!", text: "Event has been edited.", type: "success"},
					   function(){ 
					       location.reload();
					   }
					);
					if ($scope.edit_type === "upcoming") {
						$scope.upcoming_games[$scope.edit_id] = $scope.edit_game_info;
					} else if ($scope.edit_type == "current") {
						$scope.current_games[$scope.edit_id] = $scope.edit_game_info;
					}
				}, (err) => {
					swal("Failure!", "You are not the game head of this game event.", "error");
				});
			}

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

    $scope.is_past_game = () => {
      if ($scope.view.type === "past")
        return true;
      	return false;
	}

	$scope.check_if_registered = () => {
		if($scope.is_past_game() || $rootScope.profile.is_player == 0) {
			$scope.is_registered = false;
			return;
		}
		var data = {
			account_id: $rootScope.profile.account_id,
			game_id: $scope.view.gameid
		}
		GameEventService
			.get_team_of_account(data)
			.then(function(res){
				$scope.is_registered = res[0] == "";
        	},function(err){
            	console.log(err);
        })
	}

		$scope.join_account_to_team = (team) => {
			var data = {
				account_id: $rootScope.profile.account_id,
				team_id: $("#chosen_team").val()
			}

			if (data.team_id == undefined) {
				swal("Choose a team.");
			} else {
			GameEventService
				.join_account_to_team(data)
				.then(function(res){
					swal("Success!", "Successfully joined the team.", "success");
            	},function(err){
                	console.log(err);
            	})
            }

            $scope.team.account_id = undefined;
			$scope.team.team_id = undefined;
			$('#modal1').modal('close');
		}

		$scope.random_color = () => {
			return '#'+(0x1000000+(Math.random())*0xffffff).toString(16).substr(1,6);
		}

		$scope.add_game = () => {
			var data = {
				game_name: $scope.game_name,
				account_id: $rootScope.profile.account_id,
				game_starting_time_date: moment($('#add_start_game').val()).format("YYYY-MM-DD"),
				game_ending_time_date: moment($('#add_end_game').val()).format("YYYY-MM-DD")
			};
			if (!moment(data.game_ending_time_date).isAfter(data.game_starting_time_date)) {
				swal("Failed","Ending date precedes starting date.","error");
				return;
			}
			var blank = 1;
			for(var i = 0 ;i < $scope.teams.length; i++){
				if($scope.teams[i].team_name == undefined){
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
					$scope.get_upcoming_games();
          $scope.get_past_games();
					$scope.get_current_games();
            	},function(err){
            		swal(res.error);
                	console.log(err);
            	})

			}
		}

		$scope.setup_add_game = () => {
			$scope.game_name = "";
           	$('#add_start_game').val('');
           	$('#add_end_game').val('');
			$scope.teams = [];
			$scope.append_fills();
		}

		$scope.remove_team = (index) => {
			$scope.teams.splice(index,1 );
		}

		$scope.search_game = () =>{
			var data = {
				game_name: $scope.gameSearched
			}
            GameEventService
            .search_game(data)
            .then(function(res){
                $scope.allGames = res[0];
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
				} else if (type === "past"){
					GameEventService.delete_game({game_id:$scope.past_games[id].game_id}).then((err, data) => {
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
