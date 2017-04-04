'use strict';

(() => {
    angular
        .module('app')
        .controller('result-controller', result_controller);

    function result_controller($scope, $location, $routeParams, ResultService) {
      let data = [];
    	$scope.view_profile = () => {
            window.location.href="#!/profile";
        }

        $scope.view_user = () => {
            window.location.href="#!/user";
        }

        $scope.logout = () => {
            window.location.href="#!/";
        }

        $scope.back_to_home = () => {
            window.location.href="#!/game-event";
        }

        $scope.elimination_matches = [];
        $scope.semis_matches = [];
        $scope.finals_matches = [];

        // $scope.sport_id = $routeParams.sport_id;

        $scope.init_elimination_matches = () => {
            ResultService 
                .init_elimination()
                .then(function(res) {
                    for(var i=0; i<res.length; i+=2) {
                      $scope.elimination_matches.push({
                        player1: res[i],
                        player2: res[i+1]
                      })
                    }
                    console.log($scope.elimination_matches);
                }, function(err) {
                    console.log(err.data);
                })
        }

        $scope.init_semis_matches = () => {
            ResultService
                .init_semis()
                .then(function(res) {
                  for(var i=0; i<res.length; i+=2) {
                    $scope.semis_matches.push({
                      player1: res[i],
                      player2: res[i+1]
                    })
                  }
                    console.log($scope.semis_matches);
                }, function(err) {
                    console.log(err.data);
                })
        }

        $scope.init_finals_matches = () => {
            ResultService
                .init_finals()
                .then(function(res) {
                  for(var i=0; i<res.length; i+=2) {
                    $scope.finals_matches.push({
                      player1: res[i],
                      player2: res[i+1]
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
