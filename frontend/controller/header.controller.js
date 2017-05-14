'use strict';

(() => {
    angular
        .module('app')
        .controller('header-controller', header_controller);

    function header_controller($scope, $location, $window, $routeParams, $rootScope, ProfileService, LoginRegisterService) {
		$scope.init_jquery = () => {
			$('.ui.dropdown').dropdown();
			$('.ui.modal').modal();
			$('.ui.checkbox').checkbox();
			
			$('.ui.modal-close').click(function() {
				$('.ui.modal').modal('hide');
			});
			var maxDate = new Date();
			maxDate.setFullYear(maxDate.getFullYear() - 14);
			$('.register').click(function() {
				$('#register-modal').modal({
					onShow: function() {
						$('#birthday').calendar({
							type: 'date',
							maxDate: maxDate
						});
					}
				}).modal('show');
				
			});

			$('.login').click(function() {
				$('#login-modal').modal('show');
			});

			$('.close').click(function() {
				$('.ui.message').hide();
			});
		}

		$scope.info = {
			username : undefined,
			password : undefined
		}

		$scope.data = {}
		$rootScope.changeView = (view) => {
			$window.location.href = view;
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
					$rootScope.profile = undefined;
					$window.location.href = "#!/";
					location.reload();
					setTimeout($scope.init_jquery(), 0);
		        }, function(err) {
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
					$rootScope.profile = {
						account_id: undefined,
						is_admin: false,
						is_player: false,
						is_game_head: false
					};
	            }
				setTimeout($scope.init_jquery, 0);
	        }, (err) => {
				window.location.href = "#!/"
				setTimeout($scope.init_jquery, 0);
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
						$scope.get_loggedIn();
						$scope.info.username = '';
						$scope.info.password = '';
						$scope.info.username = undefined;
						$scope.info.password = undefined;
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

		$scope.back = () => {
			window.history.back();
		}

		$scope.update_is_player = () => {
			$scope.data.is_player = $scope.data.is_player ? 0 : 1;
		}

		$scope.update_is_game_head = () => {
			$scope.data.is_game_head = $scope.data.is_game_head ? 1 : 0;
		}

		$scope.register = () => {
			let NAME_REGEX = /^[A-Za-z\s]+$/;
			let USERNAME_REGEX = /^[a-zA-Z0-9_]+$/;
			let USERNAME_LENGTH_REGEX = /^[a-zA-Z0-9_]{4,}$/;
			let EMAIL_REGEX = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			let PASSWORD_REGEX = /^.{8,}$/;
			let e = document.getElementById("college");
			let strUser = e.options[e.selectedIndex].value;
			$scope.data.birthday = $('#birthday').calendar('get date');
			$scope.data.birthday = moment($scope.data.birthday).format('YYYY-MM-DD');
			$scope.data.college = strUser;
			console.log($scope.data.position)
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
				$scope.data.position === '') {
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
			} else if($scope.data.is_player == 1 && (
				$scope.data.player_role === '' ||
				$scope.data.player_role === undefined ||
				$scope.data.player_jersey_num === '' ||
				$scope.data.player_jersey_num === undefined)){
				$.uiAlert({
					textHead: "Login error", // header
					text: 'Please fill-out all the fields', // Text
					bgcolor: '#DB2828', // background-color
					textcolor: '#fff', // color
					position: 'top-center',// position . top And bottom ||  left / center / right
					icon: 'remove circle', // icon in semantic-UI
					time: 3, // time
				});

			} else if (!NAME_REGEX.test($scope.data.firsname) || 
						!NAME_REGEX.test($scope.data.middlename) ||
						!NAME_REGEX.test($scope.data.lastname)) {
				$.uiAlert({
					textHead: "Invalid name", // header
					text: 'Please only use latin letters for your name.', // Text
					bgcolor: '#DB2828', // background-color
					textcolor: '#fff', // color
					position: 'top-center',// position . top And bottom ||  left / center / right
					icon: 'remove circle', // icon in semantic-UI
					time: 3, // time
				});
			} else if (!USERNAME_REGEX.test($scope.data.username)) {
				$.uiAlert({
					textHead: "Invalid username", // header
					text: 'Please only use alphanumeric characters for your username.', // Text
					bgcolor: '#DB2828', // background-color
					textcolor: '#fff', // color
					position: 'top-center',// position . top And bottom ||  left / center / right
					icon: 'remove circle', // icon in semantic-UI
					time: 3, // time
				});
			} else if (!USERNAME_LENGTH_REGEX.test($scope.data.username)) {
				$.uiAlert({
					textHead: "Invalid username", // header
					text: 'Username must be atleast 5 characters', // Text
					bgcolor: '#DB2828', // background-color
					textcolor: '#fff', // color
					position: 'top-center',// position . top And bottom ||  left / center / right
					icon: 'remove circle', // icon in semantic-UI
					time: 3, // time
				});
			} else if (!EMAIL_REGEX.test($scope.data.email)) {
				$.uiAlert({
					textHead: "Invalid email", // header
					text: 'Please enter valid email.', // Text
					bgcolor: '#DB2828', // background-color
					textcolor: '#fff', // color
					position: 'top-center',// position . top And bottom ||  left / center / right
					icon: 'remove circle', // icon in semantic-UI
					time: 3, // time
				});
			} else if (!PASSWORD_REGEX.test($scope.data.password)) {
				$.uiAlert({
					textHead: "Invalid password", // header
					text: 'Password must be atleast 4 characters.', // Text
					bgcolor: '#DB2828', // background-color
					textcolor: '#fff', // color
					position: 'top-center',// position . top And bottom ||  left / center / right
					icon: 'remove circle', // icon in semantic-UI
					time: 3, // time
				});
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
