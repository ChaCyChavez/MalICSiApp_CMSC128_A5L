'use strict';

(() => {
	angular
		.module('app')
		.factory('ParticipantService', ParticipantService);

		ParticipantService.$inject = ['$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function ParticipantService($http, $q) {

			const get_participants = (data) => {
				let deferred = $q.defer();

				$http({
					method: 'GET',
					xhrFields: {withCredentials: false},
					url: '/api/get-participants/' + data,
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})
				return deferred.promise;
			}
		
			let service = {};
			service.get_participants = get_participants;
			return service;
			
		}

})();