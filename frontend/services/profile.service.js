'use strict';

(() => {
	angular
		.module('app')
		.factory('ProfileService', ProfileService);

		ProfileService.$inject = ['$window', '$http', '$q', '$httpParamSerializer'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function ProfileService($window, $http, $q, $httpParamSerializer) {

			
			const get_profile = () => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-account/',
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const get_profile2 = (data) => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-account/' + data,
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
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
				}, function(err) {
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
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const get_user_ongoing_events = () => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-user-ongoing-events/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const get_user_ongoing_events2 = (data) => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-user-ongoing-events/' + data,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const get_user_upcoming_events2 = (data) => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-user-upcoming-events/' + data,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const get_user_past_events2 = (data) => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-user-past-events/' + data,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const remove_own_profile = () => {
				let deferred = $q.defer();
				$http({
					method: 'POST',
					xhrFields: {withCredentials: false},
					url: '/api/delete-account/',
					headers: headers
				})
				.then(function(res) {
					 deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const remove_others_profile = (data) => {
				let deferred = $q.defer();
				$http({
					method: 'POST',
					xhrFields: {withCredentials: false},
					url: '/api/delete-account/' + data,
					headers: headers
				})
				.then(function(res) {
					 deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			let service = {};
			service.get_profile 				= get_profile;
			service.get_user_past_events 		= get_user_past_events;
			service.get_user_upcoming_events 	= get_user_upcoming_events;
			service.get_profile2 				= get_profile2;
			service.get_user_past_events2 		= get_user_past_events2;
			service.get_user_upcoming_events2 	= get_user_upcoming_events2;
			service.get_user_ongoing_events2 	= get_user_ongoing_events2;
			service.get_user_ongoing_events 	= get_user_ongoing_events;
			service.remove_own_profile			= remove_own_profile;
			service.remove_others_profile		= remove_others_profile;
			return service;
		}
})();
