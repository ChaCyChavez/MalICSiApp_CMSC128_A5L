'use strict';

(() => {
	angular
		.module('app')
		.factory('LoginRegisterService', LoginRegisterService);

		LoginRegisterService.$inject = ['$window', '$http', '$q', '$httpParamSerializer'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};


		function LoginRegisterService($window, $http, $q, $httpParamSerializer) {

			const get_currGames = function (data){
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-current-events/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const retrieve_account = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/login-account/',
					headers: headers
				})
				.then(function(res) {
					$window.location.href = '/#!/game-event';
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const register_account = function (data) {
				let deferred = $q.defer();

				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/add-account/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const logout = function () {
				let deferred = $q.defer();

				$http({
					method: 'POST',
					xhrFields: {withCredentials: false},
					url: '/api/logout-account/'
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const get_sports = function (gameid) {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-sport-game/' + gameid,
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
			service.get_sports = get_sports;
			service.retrieve_account = retrieve_account;
			service.register_account = register_account;
			service.get_currGames = get_currGames;
			service.logout = logout;
			return service;
		}
})();
