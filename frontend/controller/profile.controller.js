'use strict';
 
(() => {
  angular
    .module('app')
    .controller('profile-controller', profile_controller);
        
  profile_controller.$inject = ['$window', '$scope', '$rootScope','$location', '$routeParams', 'ProfileService'];

  function profile_controller($window, $scope, $rootScope, $location, $routeParams, ProfileService) {
    $scope.init_jquery = () => {
      $('.ui.accordion').accordion();

        var maxDate = new Date();
        maxDate.setFullYear(maxDate.getFullYear());
        $(".edit-profile")
          .click(function() {
            $("#edit-profile-modal")
              .modal({
                onShow: function() {
                  $('#edit-birthday').calendar({
                    type: 'date',
                    maxDate: maxDate
                  });
                }
              })
              .modal("show");
          });
    }
    
    $scope.get_profile_info = () => {
      ProfileService
        .get_profile()
        .then((userprofile) => {
          if (userprofile[0].length != 0) {
            $scope.userprofile = userprofile[0][0];
          }
        });

      ProfileService
        .get_user_upcoming_events()
        .then((userprofile) => {
          if (userprofile[0].length != 0) {
            $scope.user_upcoming_events = userprofile[0];
          }
        });

      ProfileService
        .get_user_past_events()
        .then((userprofile) => {
          if (userprofile[0].length != 0) {
            $scope.user_past_events = userprofile[0];
          }
        });

      ProfileService
        .get_user_ongoing_events()
        .then((userprofile) => {
          if (userprofile[0].length != 0) {
            $scope.user_ongoing_events = userprofile[0];
          }
        });
    }

    $scope.get_profile_info2 = (account_id) => {
      ProfileService
        .get_profile2(account_id)
        .then((userprofile) => {
          if (userprofile[0].length != 0) {
            $scope.userprofile = userprofile[0][0];
          }
        });

      ProfileService
        .get_user_upcoming_events2(account_id)
        .then((userprofile) => {
          if (userprofile[0].length != 0) {
            $scope.user_upcoming_events = userprofile[0];
          }
        });

      ProfileService
        .get_user_past_events2(account_id)
        .then((userprofile) => {
          if (userprofile[0].length != 0) {
            $scope.user_past_events = userprofile[0];
          }
        });

      ProfileService
        .get_user_ongoing_events2(account_id)
        .then((userprofile) => {
          if (userprofile[0].length != 0) {
            $scope.user_ongoing_events = userprofile[0];
          }
        });
    }    

    $scope.init_profile = () => {
      setTimeout($scope.init_jquery(), 0);
      if ($routeParams.account_id != undefined) {
        $scope.get_profile_info2($routeParams.account_id);
      } else {
        $scope.get_profile_info();
      }
    }

    $scope.remove_own_profile = () => {
      swal({
        title: "Are you sure?",
        text: "You will not be able to recover your account!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, delete it!",
        closeOnConfirm: false
      },
      function(){
        ProfileService
          .remove_own_profile()
          .then((userprofile) => {
            swal("Deleted!", "Your account has been deleted.", "success");
            location.reload();
            $window.location.href = "#!/";
          }, (err) => {
            swal("Failure!", "Cannot delete your account.", "error");
          });
      });
    }

    $scope.remove_others_profile = (account_id) => {
      swal({
        title: "Are you sure?",
        text: "You will not be able to recover this account!",
        type: "warning",
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: "Yes, delete it!",
        closeOnConfirm: false
      },
      function(){
        ProfileService
          .remove_others_profile(account_id)
          .then((userprofile) => {
            swal("Deleted!", "The account has been deleted.", "success");
            location.reload();
            window.location.href = "#!/user"
          }, (err) => {
            swal("Failure!", "Cannot delete your account.", "error");
          });
      });
    }

    $scope.remove_profile = () => {
      if ($routeParams.account_id != undefined) {
        $scope.remove_others_profile($routeParams.account_id);
      } else {
        $scope.remove_own_profile();
      }
    }
    $scope.setup_edit_profile = () =>{
      $scope.edit_profile =JSON.parse(JSON.stringify($scope.userprofile));
      $scope.edit_profile.college = "";
      var maxDate = new Date();
      maxDate.setFullYear(maxDate.getFullYear());
      $(".edit-profile")
        .click(function() {
          $("#edit-profile-modal")
            .modal({
              onShow: function() {
                $('#edit-birthday').calendar({
                  type: 'date',
                  maxDate: maxDate
                });
              }
            })
            .modal("show");
        });
    }
    $scope.update_is_player = () => {
      $scope.userprofile.is_player = $scope.userprofile.is_player ? 0 : 1;
    }

    $scope.update_is_game_head = () => {
      $scope.userprofile.is_game_head = $scope.userprofile.is_game_head ? 1 : 0;
    }

    $scope.edit_prof = () => {
      let NAME_REGEX = /^[A-Za-z\s]+$/;
      let USERNAME_REGEX = /^[a-zA-Z0-9_]+$/;
      let EMAIL_REGEX = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      let e = document.getElementById("college");
      let strUser = e.options[e.selectedIndex].value !== "" ? e.options[e.selectedIndex].value:$scope.edit_profile.college;
      $scope.edit_profile.birthday = $('#edit-birthday').calendar('get date');
      $scope.edit_profile.birthday = moment($scope.edit_profile.birthday).format('YYYY-MM-DD');
      $scope.edit_profile.college = strUser;
      console.log($scope.edit_profile);
      if ($scope.edit_profile.username === undefined ||
        $scope.edit_profile.username === '' ||
        $scope.edit_profile.firstname === undefined ||
        $scope.edit_profile.firstname === '' ||
        $scope.edit_profile.middlename === undefined ||
        $scope.edit_profile.middlename === '' ||
        $scope.edit_profile.lastname === undefined ||
        $scope.edit_profile.lastname === '' ||
        $scope.edit_profile.college === undefined ||
        $scope.edit_profile.college === '' ||
        $scope.edit_profile.course === undefined ||
        $scope.edit_profile.course === '' ||
        $scope.edit_profile.email === undefined ||
        $scope.edit_profile.email === '' ||
        $scope.edit_profile.birthday === undefined ||
        $scope.edit_profile.birthday === '' ||
        $scope.edit_profile.position === undefined ||
        $scope.edit_profile.position === '') {
        console.log("dito talaga");
        $.uiAlert({
          textHead: "Registration error", // header
          text: 'Please fill-out all the fields', // Text
          bgcolor: '#DB2828', // background-color
          textcolor: '#fff', // color
          position: 'top-center',// position . top And bottom ||  left / center / right
          icon: 'remove circle', // icon in semantic-UI
          time: 3, // time
        });
      } else if($scope.edit_profile.is_player == 1 && (
        $scope.edit_profile.player_role === '' ||
        $scope.edit_profile.player_role === undefined ||
        $scope.edit_profile.player_jersey_num === '' ||
        $scope.edit_profile.player_jersey_num === undefined)){
        console.log("dito")
        $.uiAlert({
          textHead: "Login error", // header
          text: 'Please fill-out all the fields', // Text
          bgcolor: '#DB2828', // background-color
          textcolor: '#fff', // color
          position: 'top-center',// position . top And bottom ||  left / center / right
          icon: 'remove circle', // icon in semantic-UI
          time: 3, // time
        });

      } else if (!NAME_REGEX.test($scope.edit_profile.firsname) || 
            !NAME_REGEX.test($scope.edit_profile.middlename) ||
            !NAME_REGEX.test($scope.edit_profile.lastname)) {
        $.uiAlert({
          textHead: "Invalid name", // header
          text: 'Please only use latin letters for your name.', // Text
          bgcolor: '#DB2828', // background-color
          textcolor: '#fff', // color
          position: 'top-center',// position . top And bottom ||  left / center / right
          icon: 'remove circle', // icon in semantic-UI
          time: 3, // time
        });
      } else if (!USERNAME_REGEX.test($scope.edit_profile.username)) {
        $.uiAlert({
          textHead: "Invalid username", // header
          text: 'Please only use alphanumeric characters for your username.', // Text
          bgcolor: '#DB2828', // background-color
          textcolor: '#fff', // color
          position: 'top-center',// position . top And bottom ||  left / center / right
          icon: 'remove circle', // icon in semantic-UI
          time: 3, // time
        });
      } else if (!EMAIL_REGEX.test($scope.edit_profile.email)) {
        $.uiAlert({
          textHead: "Invalid email", // header
          text: 'Please enter valid email.', // Text
          bgcolor: '#DB2828', // background-color
          textcolor: '#fff', // color
          position: 'top-center',// position . top And bottom ||  left / center / right
          icon: 'remove circle', // icon in semantic-UI
          time: 3, // time
        });
      } else {
        ProfileService
          .edit_profile($scope.edit_profile)
          .then(function(res) {
            // Materialize.toast("Register successful!", 4000, 'teal');
            // Materialize.toast("Your registration is now on process", 4000, 'teal');
            $.uiAlert({
              textHead: "Edit profile successful", // header
              text: 'Your profile is now edited', // Text
              bgcolor: '#19c3aa', // background-color
              textcolor: '#fff', // color
              position: 'top-center',// position . top And bottom ||  left / center / right
              icon: 'remove circle', // icon in semantic-UI
              time: 3, // time
            });
            $scope.get_profile_info();
          }, function(err) {
            // Materialize.toast(err.message, 4000, 'teal');
            swal("Failed!",err.message,"error")
          })
      }
    }
  }
})();
