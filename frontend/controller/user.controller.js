'use strict';

(() => {
    angular
        .module('app')
        .controller('user-controller', user_controller);

    function user_controller($scope, $window, $location, UserService) {

        $scope.accounts = [];
        $scope.pending_accounts = [];

        $scope.get_accounts = () => {
            UserService
                .get_all_account()
                .then(function(res) {
                    $scope.accounts = res[0];
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.get_pending_accounts = () => {
            UserService
                .get_pending_account()
                .then(function(res) {
                    $scope.pending_accounts = res[0];
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.approve_user = (data) => {
            swal({
              title: "Are you sure?",
              text: "You will not be able to revert back the account!",
              type: "warning",
              showCancelButton: true,
              confirmButtonColor: "#DD6B55",
              confirmButtonText: "Approve",
              cancelButtonText: "Disapprove",
              closeOnConfirm: false,
              closeOnCancel: false
            },
            function(isConfirm){
              if (isConfirm) {
                UserService
                .approve_account({account_id:$scope.pending_accounts[data].account_id})
                .then((res) => {
                 $scope.get_accounts();
                 $scope.pending_accounts.splice(data, 1);
      					 swal("Approved!", "Account has been approved!", "success");
                }, (err) => {
					       alert("Internal Server Error. Dev please debug.");
				});
              } else {
                UserService
                .disapprove_account({account_id:$scope.pending_accounts[data].account_id})
                .then((res) => {
                 $scope.get_pending_accounts();
                 $scope.pending_accounts.splice(data, 1);
      					 swal("Disapproved!", "Account has been disapproved!", "error");
                }, (err) => {
					       alert("Internal Server Error. Dev please debug.");
				});
              }
            });
        }

        $scope.view_account = (account_id) => {
            window.location.href="#!/profile/" + account_id;
        }

        $scope.delete_approved_user = (data) => {
          swal({
            title: "Are you sure?",
            text: "You will not be able to recover the user!",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "Yes, delete it!",
            closeOnConfirm: false
          },
          function(){
              UserService
              .disapprove_account({account_id:$scope.accounts[data].account_id}).then((err, data) => {
                swal("Deleted!", "User has been deleted.", "success");
                $scope.get_accounts();
              }, (err) => {
                swal("Failure!", "You are not allowed to delete this user.", "error");
              });
          });

        }
    }
})();
