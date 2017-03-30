var mainApp = angular.module('app', []);

mainApp.factory('MalicsiService', function ($http) {
	return {
		get_profile: (user_id) => {
			return $http({
				method: 'GET',
				url: '/api/get_account/' + user_id,
				headers: {
					'Content-Type': 'application/json'
				}
			}).then(
				function success(res) {
					return true;
				},
				function error(res) {
					return false;
				}
			);
		}
	}
}
