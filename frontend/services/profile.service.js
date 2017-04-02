'use strict';

(() => {
	angular
		.module('app')
		.factory('ProfileService', ProfileService);

		ProfileService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function ProfileService($window, $http, $q) {
			const get_profile = () => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-account/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(res) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const get_user_upcoming_events = () => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-user-upcoming-events/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(res) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const get_user_past_events = () => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-user-past-events/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(res) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			let service = {};
			service.get_profile 				= get_profile;
			service.get_user_past_events 		= get_user_past_events;
			service.get_user_upcoming_events 	= get_user_upcoming_events;
			return service;
		}
})();