'use strict';

(() => {
  angular
  .module('app')
  .controller('participant-controller', participant_controller);

  function participant_controller($scope, $window, $location, $routeParams, $interval, SportsService, TeamService) {

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
      window.location.href="#!/user";
    }

    $scope.logout = () => {
      window.location.href="#!/";
    }

    $scope.back_to_home = () => {
      window.location.href="#!/game-event";
    }

    // $scope.go_to_profile = (data) => {
    //   window.location.href="#!/profile"
    // }

    $scope.get_sports = () => {
      let data = {
        game_id : gameid
      }
      let ret_sport = [];
      SportsService
      .get_sports_game(data).
      then(function(res) {
        res.data[0].forEach(function(element){
          let obj2 = {
            sport_id: element.sport_id,
            sport_type: element.sport_type,
            division: element.division,
          };
          ret_sport.push(obj2);
        });
        $scope.sports = ret_sport;
      }, function(err) {
        console.log(err);
      });
    }

    var check_duplicates = (arr, element) => {
      let duplicate_found = false;
      arr.forEach(function(item) {
        if (item.account_id == element.account_id) {
          duplicate_found = true;
        }
      });
      return duplicate_found;
    }

    $scope.load_participants = () => {
      while ($scope.participants.length) $scope.participants.pop();
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

        s.forEach(function(sport) {
          SportsService
          .get_teams_sport(sport).
          then(function(res) {
            res.data[0].forEach(function(team){
              TeamService
              .get_team_profile(team.team_id).
              then(function(res) {
                res[0].forEach(function(element) {
                  let profile = {
                    account_id: element.account_id,
                    fullname: element.firstname + " " + element.middlename + " " + element.lastname
                  }
                  if (!check_duplicates(profiles, profile)) profiles.push(profile);
                });
              }, function(err) {
                console.log(err);
              });
            });
          }, function(err) {
            console.log(err);
          });
        });
      }, function(err) {
        console.log(err);
      });
      
      $scope.participants = profiles;
    }
  }
})();
