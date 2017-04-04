'use strict';

(() => {
	angular
		.module('app')
		.factory('UserService', UserService);

		UserService.$inject = ['$window', '$http', '$q', '$httpParamSerializer'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function UserService($window, $http, $q, $httpParamSerializer) {

			const get_all_account = () => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					url: '/api/get-all-account/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const get_pending_account = () => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					url: '/api/get-all-account/',
					headers: headers
				})
				.then(function(res) {
					console.log(res);
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const approve_account = function(data) {
				let deferred = $q.defer();
				console.log(data);
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/approve-account/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const disapprove_account = function(data) {
				let deferred = $q.defer();
				console.log(data.account_id);
				$http({
					method: 'POST',
					xhrFields: {withCredentials: false},
					url: '/api/delete-account/' + data.account_id,
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
			service.get_all_account = get_all_account;
			service.get_pending_account = get_pending_account;
			service.approve_account = approve_account;
			service.disapprove_account = disapprove_account;
			return service;
		}
})();
