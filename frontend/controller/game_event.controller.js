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

    game_event_controller.$inject = ['$scope', '$location', 'GameEventService', 'ProfileService'];

    function game_event_controller($scope, $location, GameEventService, ProfileService) {
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
				$scope.current_games = data[0];
				console.log("hello");
				console.log($scope.current_games);
			});
		}

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
			},
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

		$scope.delete_game = (type, id) => {
			if (type === 'upcoming') {
				if (confirm('Are you sure you want to delete game?')) {
					GameEventService.delete_game({game_id:$scope.upcoming_games[id].game_id}).then((err, data) => {
						Materialize.toast("Successfully deleted.");
						$scope.upcoming_games.splice(id, 1);
					});

				}
			} else {
				if (confirm('Are you sure you want to delete game')) {
					GameEventService.delete_game({game_id:$scope.current_games[id].game_id}).then((err, data) => {
							Materialize.toast("Successfully deleted.");
							$scope.current_games.splice(id, 1);
					});
				}
			}
		}
    }
})();
