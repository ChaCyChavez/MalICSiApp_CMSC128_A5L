'use strict';

(() => {
    angular
        .module('app')
        .controller('user-controller', user_controller);

    function user_controller($scope, $location, UserService) {

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
					$scope.pending_accounts.splice(data, 1);
                	Materialize.toast("Successfully approved!", 4000, 'teal');
					swal("Approved!", "Account has been approved!", "success");
                }, (err) => {
					alert("Internal Server Error. Dev please debug.");
				});
              } else {
                UserService
                .disapprove_account({account_id:$scope.pending_accounts[data].account_id})
                .then((res) => {
						$scope.pending_accounts.splice(data, 1);
	                    Materialize.toast("Successfully disapproved!", 4000, 'teal');
						swal("Disapproved!", "Account has been disapproved!", "error");
                }, (err) => {
					alert("Internal Server Error. Dev please debug.");
				});
              }
            });
        }
    }
})();
