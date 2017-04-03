'use strict';

(() => {
    angular
        .module('app')
        .controller('game-event-controller', game_event_controller);

	angular.module('app').directive('repeatDone', function() {
	    return function(scope, element, attrs) {
	        if (scope.$last) { // all are rendered
	            scope.$eval(attrs.repeatDone);
	        }
	    }
	});

    game_event_controller.$inject = ['$scope', '$rootScope','$location', 'GameEventService', 'ProfileService'];

    function game_event_controller($scope, $rootScope, $location, GameEventService, ProfileService) {
		// fetching is being implemented by other group member
		
		$scope.view_sponsor = (game_id) => {
            window.location.href="#!/sponsor/" + game_id;
        }
        $scope.view_sports = (game_id) => {
            window.location.href="#!/sports/" + game_id;
        }

        $scope.view_registered_user = () => {
            window.location.href="#!/registered-user";
        }

		$scope.get_current_games = () => {
			GameEventService.get_current_games().then((data) => {
				$scope.current_games = data[0];
				console.log(data[0]);

			});
		};

		$scope.get_upcoming_games = () => {

			GameEventService
			.get_upcoming_games()
			.then((data) => {
				$scope.upcoming_games = data[0];
				console.log($scope.current_games);
			});
		}

		$scope.current_games = [
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

		$scope.edit_game_info = {};
		$scope.setup_edit_modal = (type, id) => {
			console.log(type, id);
			if (type === 'upcoming') {
				$scope.edit_game_info = $scope.upcoming_games[id];
			} else if (type === 'current') {
				$scope.edit_game_info = $scope.current_games[id];
			}
		}

		$scope.edit_game = () => {
			GameEventService.edit_game($scope.edit_game_info).then((err, data) => {
				console.log(err, data);
			});
		}

		$scope.add_game = () => {
			var data = {
				game_name: $scope.game_name,
				// game_start: $scope.game_start,
				// game_end: $scope.game_end,
				account_id: $rootScope.profile.account_id,
				game_starting_time_date: $('#datepicker1').val(),
				game_ending_time_date: $('#datepicker2').val()
				// account_id: 1
			};

			console.log($scope.game_starting_time_date);
			console.log(data);
			GameEventService.add_game(data).then((err, data) => {
				console.log(err, data);
			});
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
						Materialize.toast("Successfully deleted.", 4000, 'teal');
						$scope.upcoming_games.splice(id, 1);
					});
				} else {
					GameEventService.delete_game({game_id:$scope.current_games[id].game_id}).then((err, data) => {
							Materialize.toast("Successfully deleted.", 4000, 'teal');
							$scope.current_games.splice(id, 1);
					});
				}
				swal("Deleted!", "Event has been deleted.", "success");
			});
		}
    }
})();
