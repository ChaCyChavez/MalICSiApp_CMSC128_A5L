'use strict';

(() => {
    angular
        .module('app')
        .controller('result-controller', result_controller);

    function result_controller($scope, $window, $location, $routeParams, ResultService) {
      let data = [];
    	$scope.view_profile = () => {
            window.location.href="#!/profile";
            $window.location.reload();
        }

        $scope.view_user = () => {
            window.location.href="#!/user";
            $window.location.reload();
        }

        $scope.logout = () => {
            window.location.href="#!/";
            $window.location.reload();
        }

        $scope.back_to_home = () => {
            window.location.href="#!/game-event";
            $window.location.reload();
        }

        $scope.elimination_matches = [];
        $scope.semis_matches = [];
        $scope.finals_matches = [];

        let sportid = $routeParams.sport_id;

        $scope.init_elimination_matches = () => {
            var data = {
                sport_id: sportid
            }          
            ResultService 
                .init_elimination(data)
                .then(function(res) {
                    for(var i=0; i<res[0].length; i+=2) {
                      $scope.elimination_matches.push({
                        player1: res[0][i],
                        player2: res[0][i+1]
                      })
                    }
                    console.log($scope.elimination_matches);
                }, function(err) {
                    console.log(err.data);
                })
        }

        $scope.init_semis_matches = () => {
            var data = {
                sport_id: sportid
            }              
            ResultService
                .init_semis(data)
                .then(function(res) {
                  for(var i=0; i<res[0].length; i+=2) {
                    $scope.semis_matches.push({
                      player1: res[0][i],
                      player2: res[0][i+1]
                    })
                  }
                    console.log($scope.semis_matches);
                }, function(err) {
                    console.log(err.data);
                })
        }

        $scope.init_finals_matches = () => {
            var data = {
                sport_id: sportid
            }              
            ResultService
                .init_finals(data)
                .then(function(res) {
                  for(var i=0; i<res[0].length; i+=2) {
                    $scope.finals_matches.push({
                      player1: res[0][i],
                      player2: res[0][i+1]
                    })
                  }
                  console.log($scope.finals_matches);
                }, function(err) {
                    console.log(err.data);
                })
        }

        $scope.init_matches = () => {
          $scope.init_elimination_matches();
          $scope.init_semis_matches();
          $scope.init_finals_matches();

        }

    }
})();
