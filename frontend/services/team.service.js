'use strict';

(() => {
	angular
		.module('app')
		.factory('TeamService', TeamService);

		const headers = {
		    'content-type': 'application/x-www-form-urlencoded'
		};

		function TeamService($http, $q, $window) {

			const get_team_profile = (data) => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-team-profile/' + data,
					headers: headers
				})
				.then(function(res) {
					console.log(res);
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				});
				return deferred.promise;
			}

			const get_team_match = (data) => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-team-match/' + data,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				});
				return deferred.promise;
			}

			const get_team_name = (data) => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-team-name/' + data,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				});
				return deferred.promise;
			}
			let service = {};
			service.get_team_match = get_team_match;
			service.get_team_profile = get_team_profile;
			service.get_team_name = get_team_name;
			return service;
		}
})();
