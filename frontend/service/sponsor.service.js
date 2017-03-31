'use strict';

(() => {
	angular
		.module('app')
		.factory('SponsorService', SponsorService);

		SponsorService.$inject = ['$window', '$http', '$q'];

		const headers = {
			'content-type': 'application/x-www-form-urlencoded'
		};

		function SponsorService($window, $http, $q) {
			const get_sponsor = function (data) {
				let deferred = $q.defer();
				$http({
					method: 'GET',
					params: data,
					xhrFields: {withCredentials: true},
					url: '/api/get-sponsor/:sponsor_id',
					headers: headers
				})
				.then(function(res) {
					deferred.resolve(res.data);
				}, function(err) {
					deferred.reject(err.data);
				})

				return deferred.promise;
			}

			let service 		= 				{};
			service.get_sponsor	= 				get_sponsor;
			return service;

		}
})();