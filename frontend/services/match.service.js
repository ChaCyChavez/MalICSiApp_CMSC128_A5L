'use strict';

(() => {
	angular
		.module('app')
		.factory('MatchService', MatchService);

		MatchService.$inject = ['$window', '$http', '$q', '$httpParamSerializer'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function MatchService($window, $http, $q, $httpParamSerializer) {
			const add_match = function(data) {
				let deferred = $q.defer();
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/add-match-event/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const delete_match = function(data) {
				let deferred = $q.defer();
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/delete-match-event/',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const update_match = function (data) {
				let deferred = $q.defer();
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/update-match-court',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const init_match = (data) => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-match-event/' + data,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}

			const init_match_teams_scores = (data) => {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					url: '/api/get-teams-N-scores-of-match/' + data,
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			const determine_winner = (data) => {
				let indexOfWinner = 0;
				let winnerScore = data[0].score;
				for (let i = 0; i<data.length; i++) {
					data[i].is_winner = false;
					if (data[i].score > winnerScore) indexOfWinner = i;
				}
				data[indexOfWinner].is_winner = true;
				let allEqual = true;
				for (let i = 0; i<data.length; i++) {
					if(data[i].score != data[indexOfWinner].score){
						allEqual = false;
						break;
					}
				}
				data[indexOfWinner].is_winner = allEqual == true? false:true;
			}

			const update_scores = function(data) {
				let deferred = $q.defer();
				$http({
					method: 'POST',
					data: $httpParamSerializer(data),
					xhrFields: {withCredentials: false},
					url: '/api/update-match-score',
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
			service.add_match = add_match;
			service.delete_match = delete_match;
			service.init_match = init_match;
			service.update_match = update_match;
			service.init_match_teams_scores = init_match_teams_scores;
			service.determine_winner = determine_winner;
			service.update_scores = update_scores;
			
			return service;
		}
})();
