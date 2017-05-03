'use strict';

(() => {
  angular
  .module('app')
  .controller('participant-controller', participant_controller);

  function participant_controller($scope, $window, $rootScope, $location, $routeParams, $interval, SportsService, TeamService, ParticipantService) {

    var gameid = $routeParams.game_id;
    $scope.sports = [
    ];
    $scope.sport = "All Sports";
    $scope.selected = 0;
    $scope.selected_sport = {};
    $scope.participants = [];

    $scope.change_view = (view) => {
      window.location.href= view + gameid;
    }

    $scope.view_profile = () => {
      window.location.href="#!/profile";
    }
    $scope.view_user = () => {
      window.location.href="#!/user";reg
    }

    $scope.logout = () => {
      window.location.href="#!/";
    }

    $scope.back_to_home = () => {
      window.location.href="#!/game-event";
    }

    $scope.load_participants = () => {
      if($rootScope.profile === undefined){
        window.location.href="#!/";
        return;
      }
      $scope.participants = [];
      var s = [];
      var profiles = [];

      let data = {
        game_id: gameid
      }

      SportsService
      .get_sports_game(data).
      then(function(res) {
        if ($scope.selected != 0) {
          s.push({sport_id: $scope.selected.sport_id});
          $scope.sport = $scope.selected.sport_type + " - " + $scope.selected.division;
        }
        else {
          $scope.sport = "All Sports";
          res.data[0].forEach(function(sport){  
            s.push({sport_id: sport.sport_id});
          });
        }
      }, function(err) {
        console.log(err);
      });
      
      ParticipantService.get_participants(gameid).then((data) => {
        $scope.participants = data[0];
      });
    }
  }
})();
