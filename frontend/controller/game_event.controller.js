'use strict';

(() => {
    angular
        .module('app')
        .controller('game-event-controller', game_event_controller);

    game_event_controller.$inject = ['$scope', '$location', 'GameEventService', 'ProfileService'];

    function game_event_controller($scope, $location, GameEventService, ProfileService) {
		// fetching is being implemented by other group member
		$scope.current_games = [
		{
			game_id: 1,
			name: "Game 1",
			game_starting_time_date: '2017-05-12',
			game_ending_time_date: '2017-03-13'
		},
		{
			game_id: 2,
			name: "Game 2",
			game_starting_time_date: '2017-05-12',
			game_ending_time_date: '2017-03-13'
		}
		];

		$scope.upcoming_games = [
		{
			game_id: 3,
			name: "Game 3",
			game_starting_time_date: '2017-05-12',
			game_ending_time_date: '2017-03-13'
		},
		{
			game_id: 4,
			name: "Game 4",
			game_starting_time_date: '2017-05-12',
			game_ending_time_date: '2017-03-13'
		},
		{
			game_id: 3,
			name: "Game 5",
			game_starting_time_date: '2017-05-12',
			game_ending_time_date: '2017-03-13'
		},
		{
			game_id: 4,
			name: "Game 6",
			game_starting_time_date: '2017-05-12',
			game_ending_time_date: '2017-03-13'
		},
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
