'use strict';

(() => {
	angular.module('app').
        factory('MalicsiService', function ($http) {
			return {
				get_profile: (user_id) => {
					return $http({
						method: 'GET',
						url: '/api/get-account/' + user_id,
						headers: {
							'Content-Type': 'application/json'
						}
					}).then(
						function success(res) {
							return res;
						},
						function error(res) {
							return res;
						}
					);
				}
			}
		});
})();
