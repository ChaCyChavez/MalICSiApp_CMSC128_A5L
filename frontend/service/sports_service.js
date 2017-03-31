'use strict';

(() => {
	angular
		.module('app')
		.factory('SportsService', SportsService);

		SportsService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function SportsService($window, $http, $q) {

			const add_sport = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'POST',
					params: data,
					xhrFields: {withCredentials: true},
					url: '/api/add-sport',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}


			const update_sport = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'POST',
					params: data,
					xhrFields: {withCredentials: true},
					url: '/api/update-sport',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const get_sports = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					params: data,
					xhrFields: {withCredentials: true},
					url: '/api/get-all-sport',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const delete_sport = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'POST',
					params: data,
					xhrFields: {withCredentials: true},
					url: '/api/delete-sport',
					headers: headers
					
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const get_teams = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: true},
					url: '/api/get-sport-team-match/' + data.game_id,
					headers: headers
					
				})
				.then(function(res) {
					deferred.resolve(res);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			let service = {};
			service.add_sport 				= add_sport;
			service.update_sport 			= update_sport;
			service.get_sports 				= get_sports;
			service.delete_sport			= delete_sport;
			service.get_teams				= get_teams;
			return service;

		}
})();