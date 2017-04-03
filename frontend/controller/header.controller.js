'use strict';

(() => {
    angular
        .module('app')
        .controller('header-controller', header_controller);

    header_controller.$inject = ['$scope', '$location', '$routeParams', '$rootScope', 'ProfileService', 'LoginRegisterService'];

    function header_controller($scope, $location, $routeParams, $rootScope, ProfileService, LoginRegisterService) {
		$rootScope.changeView = (view) => {
			$location.url(view);
			location.reload();
		}

		$rootScope.logout = () => {
			alert("TO DO: please implement logout in backend and replace this alert with a call to the API");
		}

        ProfileService
        .get_profile()
            .then((data) => {
            if (data[0].length != 0) {
                $rootScope.profile = data[0][0];
            }
        });

		$scope.info = {
			username : undefined,
			password : undefined
		}

		$scope.data = {
			username: undefined,
			password: undefined,
			first_name: undefined,
			middle_name: undefined,
			last_name: undefined,
			college: undefined,
			course: undefined,
			email: undefined,
			position: undefined,
			birthday: undefined,
			is_player: undefined,
			player_jersey_num: 0,
			player_role: undefined
		}

		$rootScope.changeView = (view) => {
			$location.url(view);
			location.reload();
		}

		$rootScope.logout = () => {
			LoginRegisterService
		        .logout()
		        .then(function(res) {
					Materialize.toast(res.message, 4000, 'teal');
					$location.url('/');
					location.reload();
		        }, function(err) {
					Materialize.toast('Logout unsuccessful!', 4000, 'teal');
		        })

		}

		$scope.login = () => {
			if ($scope.info.username === undefined ||
				$scope.info.username === '' ||
				$scope.info.password === undefined ||
				$scope.info.password === '') {
				Materialize.toast("Please fill-out all the fields", 4000, 'teal');
				$scope.info.username = '';
				$scope.info.password = '';
				$scope.info.username = undefined;
				$scope.info.password = undefined;
				$("#modal-login").modal('close');
			} else {
				LoginRegisterService
					.retrieve_account($scope.info)
					.then(function(res) {
						$("#modal-login").modal('close');
						window.location = '#!/game-event';
						location.reload();
					}, function(err) {
						Materialize.toast(err.message, 4000, 'teal');
						$scope.info.username = '';
						$scope.info.password = '';
						$scope.info.username = undefined;
						$scope.info.password = undefined;
					})
			}
		}

		$scope.register = () => {

			let isplayer = $("#is_player").is(":checked");
			let e = document.getElementById("opt");
			let strUser = e.options[e.selectedIndex].value;
			$scope.data.birthday = new Date($('.datepicker').val());
			$scope.data.college = strUser;

			if (isplayer)
			{
				$scope.data.is_player = 1;
			}
			else
			{
				$scope.data.is_player = 0;
			}
			console.log(JSON.stringify($scope.data));

			if ($scope.data.username === undefined ||
				$scope.data.username === '' ||
				$scope.data.password === undefined ||
				$scope.data.password === '' ||
				$scope.data.first_name === undefined ||
				$scope.data.first_name === '' ||
				$scope.data.middle_name === undefined ||
				$scope.data.middle_name === '' ||
				$scope.data.last_name === undefined ||
				$scope.data.last_name === '' ||
				$scope.data.college === undefined ||
				$scope.data.college === '' ||
				$scope.data.course === undefined ||
				$scope.data.course === '' ||
				$scope.data.email === undefined ||
				$scope.data.email === '' ||
				$scope.data.birthday === undefined ||
				$scope.data.birthday === '' ||
				$scope.data.position === undefined ||
				$scope.data.position === '' ||
				$scope.data.player_role === undefined ||
				$scope.data.player_role === '') {
				Materialize.toast("Please fill-out all the fields", 4000, 'teal');
				$scope.data.username = '';
				$scope.data.password = '';
				$scope.data.first_name = '';
				$scope.data.middle_name = '';
				$scope.data.last_name = '';
				$scope.data.college = '';
				$scope.data.course = '';
				$scope.data.email = '';
				$scope.data.birthday = '';
				$scope.data.position = '';
				$scope.data.player_role = '';
				$("#modal-register").modal('close');
			} else {
				LoginRegisterService
					.register_account($scope.data)
					.then(function(res) {
						$("#modal-register").modal('close');
						Materialize.toast("Register successful!", 4000, 'teal');
						Materialize.toast("Your registration is now on process", 4000, 'teal');
					}, function(err) {
						Materialize.toast(err.message, 4000, 'teal');
					})
			}
		}
    }
})();
