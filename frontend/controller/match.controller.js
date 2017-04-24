'use strict';

(() => {
    angular
        .module('app')
        .controller('match-controller', match_controller);

    function match_controller($scope, $window, $location, MatchService) {

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

        $scope.view_team = (team_id) => {
            window.location.href="#!/team/" + team_id;
            $window.location.reload();
        }
        
        let x = $location.path().toString().split("/");
        $scope.match_id = parseInt(x[x.length-1]);
        $scope.court = undefined;
        $scope.match = undefined;
        $scope.not_editing = true;
        $scope.editing = false;
        $scope.match_teams_scores = [];

        $scope.init_match = () => {
            MatchService
                .init_match($scope.match_id)
                .then(function(res) {
                    $scope.match = res[0][0];
                }, function(err) {
                    window.location.href = "#!/error_404"
                })
        }

        $scope.init_match_teams = () => {
            MatchService
                .init_match_teams_scores($scope.match_id)
                .then(function(res) {
                    $scope.match_teams_scores = res[0];
                    MatchService.determine_winner($scope.match_teams_scores);
                }, function(err) {
                    console.log(err);
                })
        }

        $scope.edit_scores = () => {
            $('.scores').prop('contentEditable', true);
            $(".scores").keypress(function(e){ return e.which != 13; });
            $scope.not_editing = false;
            $scope.editing = true;
        }

        $scope.save_scores = () => {
            var counter = 0;

            $(".scores").each(function() {
                $scope.match_teams_scores[counter].score = $(this).html();
                var data = {
                    team_id: $scope.match_teams_scores[counter].team_id,
                    match_id: $scope.match_id,
                    score: $scope.match_teams_scores[counter].score
                }

                $scope.update_scores(data);
                counter = counter + 1;
            });

            MatchService.determine_winner($scope.match_teams_scores);
            $('.scores').prop('contentEditable', false);
            $scope.not_editing = true;
            $scope.editing = false;
        }

        $scope.cancel = () => {
            var counter = 0;
            $('.scores').prop('contentEditable', false);

            $(".scores").each(function() {
                $(this).html($scope.match_teams_scores[counter].score);
                counter = counter + 1;
            });

            $scope.not_editing = true;
            $scope.editing = false;
        }

        $scope.update_scores = (data) => {
            MatchService
                .update_scores(data)
                .then(function(res) {
                    console.log(res[0]);
                }, function(err) {
                    console.log(err);
                })
        }
    }
})();
