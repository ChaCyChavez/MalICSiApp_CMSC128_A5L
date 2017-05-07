'use strict';

(() => {
    angular
        .module('app')
        .controller('match-controller', match_controller);

    function match_controller($scope, $window, $rootScope, $location, $filter, MatchService) {
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

        $scope.view_team = (team_id) => {
            window.location.href="#!/team/" + team_id;
        }
        
        let x = $location.path().toString().split("/");
        $scope.match_id = parseInt(x[x.length-1]);
        $scope.court = undefined;
        $scope.match = undefined;
        $scope.not_editing = true;
        $scope.editing = false;
        $scope.match_teams_scores = [];
        $scope.is_not_done = undefined;

        $scope.init_match = () => {
            MatchService
                .init_match($scope.match_id)
                .then(function(res) {
                    $scope.match = res[0][0];
                    console.log($scope.match);
                    let d = new Date();
                    $scope.is_not_done = $scope.match.game_ending_time_date > d.toISOString();

                    let date = new Date($scope.match.match_date_time);
                    $scope.edit_match_info.match_date_time = $filter('date')(date, 'MMMM d, y h:mm a');
                    $scope.edit_match_info.match_id = $scope.match_id;
                    $scope.edit_match_info.court_name = $scope.match.court_name;
                    $scope.edit_match_info.court_type = $scope.match.court_type;

                    $('ui.dropdown').dropdown();
                    
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
            $(".scores").keypress(function(e){ return (e.which != 13)});
            $(".scores").keypress(function(e){(e.which >= 48 || e.which <=57)});
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
                }, function(err) {
                    console.log(err);
                })
        }

        $scope.update_match_event = (data) => {
            MatchService
                .update_match_event(data)
                .then(function(res) {
                }, function(err) {
                    console.log(err);
                })
        }
	 
    	$scope.edit_match_info = {};
    	$scope.edit_id = -1;

        $scope.setup_edit_modal = () => {
            let d1 = new Date($scope.match.game_starting_time_date);
            let d2 = new Date($scope.match.game_ending_time_date);

            $("#edit-match-modal").modal({
                onShow: function() {
                    $('#match-date').calendar({
                        type: 'datetime',
                        minDate: d1,
                        maxDate: d2
                    }).calendar('set date', $scope.edit_match_info.match_date_time);
                }
            });
            $("#edit-match-modal").modal("show");
        }

    	$scope.edit_match = (data) => {
            console.log(data);
            var court = $('#c').val();
            console.log(court);
            var court_type = "";
            $scope.edit_match_info.court_name = court;
            if (court == "Baker Hall" || court == "Copeland Gym") court_type = "Gym";
            else if (court == "Physci Building") court_type = "Building";
            else court_type = "Park";
            $scope.edit_match_info.court_type = court_type;
            var wow = new Date($('#edit-match-date').val());
    	    $scope.edit_match_info.match_date_time = 
                wow.getFullYear() + '-' + (wow.getMonth()+1) + 
                 '-' + wow.getDate()  + ' ' + wow.getHours() +
                 ':' + wow.getMinutes();
            console.log($scope.edit_match_info);
            if ($scope.edit_match_info.court_name === undefined ||
                    $scope.edit_match_info.court_type === undefined ||
                    $scope.edit_match_info.court_location === undefined) {
                    swal("Error!", "Please fill up all fields", "error")
                } else if ($scope.edit_match_info.court_name === "" ||
                    $scope.edit_match_info.court_type === "" ||
                    $scope.edit_match_info.court_location === "") {
                    swal("Error!", "Please fill up all fields", "error") 
    	    } else { 
    		    MatchService
    		        .init_match($scope.edit_match_info.match_id)
    		        .then(function(res) {
    		                MatchService
    		                    .update_match($scope.edit_match_info)
    		                    .then(function(res){
    		                        $scope.court = $scope.edit_match_info.court;
    		                        swal("Success!" ,"Match has been successfully edited.", "success");
    		                    } , function(err){
    		                        console.log(err)
    		                        swal(err.message);
    		                    });
    		        }, function(err) {
    		            swal(err.message);
    		        })
    		}
        }

    }
})();
