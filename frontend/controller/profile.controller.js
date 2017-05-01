'use strict';

(() => {
    angular
        .module('app')
        .controller('profile-controller', profile_controller);
        
    profile_controller.$inject = ['$window', '$scope', '$rootScope','$location', '$routeParams', 'ProfileService'];

    function profile_controller($window, $scope, $rootScope, $location, $routeParams, ProfileService) {

        $scope.get_profile_info = () => {
            ProfileService
                .get_profile()
                .then((data) => {
                    if (data[0].length != 0) {
                        $scope.userprofile = data[0][0];
                    }
                });

            ProfileService
                .get_user_upcoming_events()
                .then((data) => {
                    if (data[0].length != 0) {
                        $scope.user_upcoming_events = data[0];
                    }
                });

            ProfileService
                .get_user_past_events()
                .then((data) => {
                    if (data[0].length != 0) {
                        $scope.user_past_events = data[0];
                    }
                });

            ProfileService
                .get_user_ongoing_events()
                .then((data) => {
                    if (data[0].length != 0) {
                        $scope.user_ongoing_events = data[0];
                    }
                });
        }

        $scope.get_profile_info2 = (account_id) => {
            ProfileService
                .get_profile2(account_id)
                .then((data) => {
                    if (data[0].length != 0) {
                        $scope.userprofile = data[0][0];
                    }
                });

            ProfileService
                .get_user_upcoming_events2(account_id)
                .then((data) => {
                    if (data[0].length != 0) {
                        $scope.user_upcoming_events = data[0];
                    }
                });

            ProfileService
                .get_user_past_events2(account_id)
                .then((data) => {
                    if (data[0].length != 0) {
                        $scope.user_past_events = data[0];
                    }
                });

            ProfileService
                .get_user_ongoing_events2(account_id)
                .then((data) => {
                    if (data[0].length != 0) {
                        $scope.user_ongoing_events = data[0];
                    }
                });
        }    

        $scope.init_profile = () => {
           if ($routeParams.account_id != undefined) {
            $scope.get_profile_info2($routeParams.account_id);
           } else {
            $scope.get_profile_info();
           }
        }

        $scope.remove_profile = () => {
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
              .remove_user()
              .then((err, data) => {
                  swal("Deleted!", "Your account has been deleted.", "success");
                  location.reload();
                  $window.location.href = "#!/";
              }, (err) => {
                swal("Failure!", "Cannot delete your account.", "error");
              });
          });
        }
    }
})();
