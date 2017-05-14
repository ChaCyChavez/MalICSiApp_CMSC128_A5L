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
    $scope.visit_profile= (data) => {
      window.location.href="#!/profile" + data;
    }
    
    $scope.load_participants = () => {
      $scope.participants = [];
      var s = [];
      var profiles = [];

      let data = {
        game_id: gameid
      }
      
      ParticipantService.get_participants(gameid).then((data) => {
        $scope.participants = data[0];
      });
    }
  }
})();
