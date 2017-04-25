'use strict';

(() => {
    angular
        .module('app')
        .controller('header-controller', header_controller);

    header_controller.$inject = ['$scope', '$location', '$window', '$routeParams', '$rootScope', 'ProfileService', 'LoginRegisterService'];

    function header_controller($scope, $location, $window, $routeParams, $rootScope, ProfileService, LoginRegisterService) {


		$scope.info = {
			username : undefined,
			password : undefined
		}

		$scope.data = {
			username: undefined,
			password: undefined,
			firstname: undefined,
			middlename: undefined,
			lastname: undefined,
			college: undefined,
			course: undefined,
			email: undefined,
			position: undefined,
			birthday: undefined,
			is_player: undefined,
			is_game_head: undefined,
			player_jersey_num: 0,
			player_role: undefined
		}

		$rootScope.changeView = (view) => {
			$window.location.href = view;
			$window.location.reload();
		}

		$rootScope.ngRepeatFinished = () => {
            $('.special.cards .image').dimmer({
                on: 'hover'
            });
        }

		$rootScope.logout = () => {
			LoginRegisterService
		        .logout()
		        .then(function(res) {
					// Materialize.toast(res.message, 4000, 'teal');
					$window.location.href = "#!/"
					window.location.reload();
		        }, function(err) {
					// Materialize.toast('Logout unsuccessful!', 4000, 'teal');
		        })

		}

		$rootScope.activate = () => {
			$("#dropdown1").dropdown('open');
		}

		$scope.get_loggedIn = () => {
	        ProfileService
	        .get_profile()
	            .then((data) => {
	            if (data[0].length != 0) {
	                $rootScope.profile = data[0][0];
	            } else {
	            	$window.location.href = "#!/";
	            }
	        }, (err) => {
				window.location.href = "#!/"
			});
	    }

		$scope.login = () => {
			if ($scope.info.username === undefined ||
				$scope.info.username === '' ||
				$scope.info.password === undefined ||
				$scope.info.password === '') {
				$.uiAlert({
					textHead: "Login error", // header
					text: 'Please fill-out all the fields', // Text
					bgcolor: '#DB2828', // background-color
					textcolor: '#fff', // color
					position: 'top-center',// position . top And bottom ||  left / center / right
					icon: 'remove circle', // icon in semantic-UI
					time: 3, // time
				});
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
						$window.location.href = '#!/game-event';
						location.reload();
					}, function(err) {
						$.uiAlert({
							textHead: "Login error", // header
							text: err.message, // Text
							bgcolor: '#DB2828', // background-color
							textcolor: '#fff', // color
							position: 'top-center',// position . top And bottom ||  left / center / right
							icon: 'remove circle', // icon in semantic-UI
							time: 3, // time
						});
						$scope.info.username = '';
						$scope.info.password = '';
						$scope.info.username = undefined;
						$scope.info.password = undefined;
					})
			}
		}

		$scope.register = () => {
			let isplayer = $("#is_player").is(":checked");
			let isgamehead = $("#is_game_head").is(":checked");
			let e = document.getElementById("college");
			let strUser = e.options[e.selectedIndex].value;
			$scope.data.birthday = $('#birthday').calendar('get date');
			$scope.data.birthday = moment($scope.data.birthday).format('YYYY-MM-DD');
			$scope.data.college = strUser;

			if (isplayer)
			{
				$scope.data.is_player = 1;
			}
			else
			{
				$scope.data.is_player = 0;
			}

			if (isgamehead)
			{
				$scope.data.is_game_head = 1;
			}
			else
			{
				$scope.data.is_game_head = 0;
			}

			if ($scope.data.username === undefined ||
				$scope.data.username === '' ||
				$scope.data.password === undefined ||
				$scope.data.password === '' ||
				$scope.data.firstname === undefined ||
				$scope.data.firstname === '' ||
				$scope.data.middlename === undefined ||
				$scope.data.middlename === '' ||
				$scope.data.lastname === undefined ||
				$scope.data.lastname === '' ||
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
				$.uiAlert({
					textHead: "Registration error", // header
					text: 'Please fill-out all the fields', // Text
					bgcolor: '#DB2828', // background-color
					textcolor: '#fff', // color
					position: 'top-center',// position . top And bottom ||  left / center / right
					icon: 'remove circle', // icon in semantic-UI
					time: 3, // time
				});
				$scope.data.username = '';
				$scope.data.password = '';
				$scope.data.firstname = '';
				$scope.data.middlename = '';
				$scope.data.lastname = '';
				$scope.data.college = '';
				$scope.data.course = '';
				$scope.data.email = '';
				$scope.data.birthday = '';
				$scope.data.position = '';
				$scope.data.player_role = '';
			} else {
				LoginRegisterService
					.register_account($scope.data)
					.then(function(res) {
						// Materialize.toast("Register successful!", 4000, 'teal');
						// Materialize.toast("Your registration is now on process", 4000, 'teal');
						$.uiAlert({
							textHead: "Registration successful", // header
							text: 'Your registration is now on process', // Text
							bgcolor: '#19c3aa', // background-color
							textcolor: '#fff', // color
							position: 'top-center',// position . top And bottom ||  left / center / right
							icon: 'remove circle', // icon in semantic-UI
							time: 3, // time
						});
						$scope.data.username = '';
						$scope.data.password = '';
						$scope.data.firstname = '';
						$scope.data.middlename = '';
						$scope.data.lastname = '';
						$scope.data.college = '';
						$scope.data.course = '';
						$scope.data.email = '';
						$scope.data.position = '';
						$scope.data.birthday = '';
						$scope.data.is_player = '';
						$scope.data.is_game_head = '';
						$scope.data.player_jersey_num = 0;
						$scope.data.player_role = '';
						$scope.data.username = undefined;
						$scope.data.password = undefined;
						$scope.data.firstname = undefined;
						$scope.data.middlename = undefined;
						$scope.data.lastname = undefined;
						$scope.data.college = undefined;
						$scope.data.course = undefined;
						$scope.data.email = undefined;
						$scope.data.position = undefined;
						$scope.data.birthday = undefined;
						$scope.data.is_player = undefined;
						$scope.data.is_game_head = undefined;
						$scope.data.player_jersey_num = 0;
						$scope.data.player_role = undefined;
					}, function(err) {
						// Materialize.toast(err.message, 4000, 'teal');
					})
			}
		}
    }
})();
