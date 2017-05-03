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
        maxDate.setFullYear(maxDate.getFullYear() - 14);
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
      if($window.sessionStorage.profile == "undefined"){
        window.location.href="#!/";
        return;
      }
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

    $scope.update_is_player = () => {
      $scope.userprofile.is_player = $scope.userprofile.is_player ? 0 : 1;
    }

    $scope.update_is_game_head = () => {
      $scope.userprofile.is_game_head = $scope.userprofile.is_game_head ? 1 : 0;
    }

    /*$scope.setup_edit_profile = () => {
      $scope.userprofile
    }*/

    $scope.edit_profile = () => {
      let NAME_REGEX = /^[A-Za-z\s]+$/;
      let USERNAME_REGEX = /^[a-zA-Z0-9]+$/;
      let EMAIL_REGEX = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
      let e = document.getElementById("college");
      let strUser = e.options[e.selectedIndex].value;
      $scope.userprofile.birthday = $('#birthday').calendar('get date');
      $scope.userprofile.birthday = moment($scope.userprofile.birthday).format('YYYY-MM-DD');
      $scope.userprofile.college = strUser;
      console.log($scope.userprofile);
      ProfileService
        .edit_profile($scope.userprofile)
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
        }, function(err) {
          // Materialize.toast(err.message, 4000, 'teal');
          swal("Failed!",err.message,"error")
        })
    }
  }
})();
