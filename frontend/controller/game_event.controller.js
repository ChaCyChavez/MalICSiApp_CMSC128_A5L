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

		$scope.get_current_games = () => {
			GameEventService.get_current_games().then((data) => {
				$scope.current_games = data[0];
				console.log(data[0]);

			});
		};

		$scope.get_upcoming_games = () => {
			GameEventService.get_upcoming_games().then((data) => {
				$scope.upcoming_games = data[0];
				console.log(data[0])
			});
		}

		$scope.current_games = [];

		$scope.upcoming_games = [];

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
