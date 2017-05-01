'use strict';
 
(() => {
    angular
        .module('app')
        .controller('sport-controller', sport_controller);

    function sport_controller($scope, $rootScope, $location, $routeParams, SportService) {

        var sportid = $routeParams.sport_id;
        $scope.sportid = $routeParams.sport_id;

        $scope.view_tournament_bracketing = (sport_id) => {
            window.location.href="#!/result/" + sport_id;
        }

        $scope.view_match = (match_id) => {
            window.location.href="#!/match/" + match_id;
        }
        $scope.view_user = () => {
            window.location.href="#!/user";
        }

        $scope.view_participant = () => {
            window.location.href="#!/participant";
        }

        $scope.view_profile = () => {
            window.location.href="#!/profile";
        }

        $scope.view_team = (team_id) => {
            window.location.href="#!/team/" + team_id;
        }

        $scope.logout = () => {
            window.location.href="#!/";
        }

        $scope.back_to_home = () => {
            window.location.href="#!/game-event";
        }
        
        $scope.starting_date = "";
        $scope.ending_date = "";
        $scope.is_not_done = true;

        $scope.init_sport = () => {
            SportService.get_sport({"sport_id":$scope.sportid}).then((data) => {
                $scope.sport = data[0][0];
                $scope.is_owner = $scope.sport.account_id == $rootScope.profile.account_id;
                $scope.starting_date = $scope.sport.game_starting_time_date;
                $scope.ending_date = $scope.sport.game_ending_time_date;

                let d = new Date();
                $scope.is_not_done = $scope.sport.game_ending_time_date > d.toISOString();
            });
        }
        
        $scope.matches = []
        $scope.get_matches = () => {
            let data = {
                sport_id: sportid
            } 
            let ret_match = [];
            SportService
                .get_match(data).
                then(function(res) {
                    let arr = res.data[0];
                    let matches = [];
                    let teams = [];
                    let team_list = [];
                    let match_ids = [];
                    arr.forEach(function(element){
                        if(!match_ids.includes(element.match_id)){
                            match_ids.push(element.match_id);
                        }
                        if(!teams.includes(element.team_name)){
                            teams.push(element.team_name);
                        }                        
                    });
                    teams.forEach(function(teamname){
                        let BreakException = {};
                        try{
                            arr.forEach(function(element){

                                if(teamname === element.team_name){
                                    let ob = {
                                        "team_id": element.team_id,
                                        "team_name": element.team_name,
                                        "team_color": element.team_color.toLowerCase()
                                    }
                                    team_list.push(ob);
                                    throw BreakException;
                                }                      
                            }); 
                        }catch (e) {
                            if (e !== BreakException) throw e;
                        }
                    });

                    match_ids.forEach(function(i){
                        let obj = {
                            ["match_id"]:i,
                            ["date_time"]: null,
                            ["court_name"]: null,
                            ["teams"]: []
                        }
                        arr.forEach(function(j){
                            if(j.match_id === i){
                                obj["match_id"] = j.match_id;
                                obj["date_time"] = j.match_date_time;
                                obj["court_name"] = j.court_name;
                                if(!obj["teams"].includes(j.team_name)){
                                    j.team_color = j.team_color.toLowerCase();
                                    obj["teams"].push(j);
                                }
                            }
                        });
                        matches.push(obj);
                    });
                    $scope.matches = matches;
                    console.log($scope.matches);
                    $scope.teams = team_list;
                    let BreakException = {};
                    try{
	                    matches.forEach(function(j){
	                        if(j.teams.length != 2){
	                        	document.getElementById("tourn-brac").disabled = true;
	                        	$scope.dis_tourn = true;
	                        	throw BreakException;
	                        }
	                    });
                    }catch (e) {
                        if (e !== BreakException) throw e;
                    }        
                }, function(err) {
                    console.log(err);
                });
        }

        $scope.delete_match = (id,index) => {
            let data = {
                match_id: id
            }
            swal({
                  type: "warning",
                  title: "Are you sure?",
                  showCancelButton: true,
                  confirmButtonColor: "#DD6B55",
                  confirmButtonText: "Yes, delete it!",
                  closeOnConfirm: true
                },
                function(){
                    SportService
                        .delete_match(data).
                        then(function(res) {
                            // $scope.matches.splice(index, 1);
                            $scope.get_matches();
                            swal("Deleted!", "Sport has been successfully removed.", "success");
                        }, function(err) {
                            swal(err.message);
                        });

                });



        }
        $scope.match_teams = [];

        $scope.data = {}
        $scope.get_game_event_teams = () => {
            $scope.data = {
                sport_id:$scope.sportid
            }
            SportService
                .get_match_teams($scope.data)
                .then(function(res) {
                    $scope.match_teams = res.data[0];
                }, function(err) {
                    swal(err.message);
                })
        }
        $scope.add_match = () => {
            var selectedValues = [];    
            $("#teamJoin :selected").each(function(){
                selectedValues.push($(this).val()); 
            });
            var wow = new Date($('#add-start-match').val());
            var courttype = "";
            var court = $('#courtJoin').val();
            if (court == "Baker Hall" || court == "Copeland Gym") courttype = "Gym";
            else if (court == "Physci Building") courttype = "Building";
            else courttype = "Park"
            var data = {
                status: 1,
                match_date_time: wow.getFullYear() + '-' + (wow.getMonth()+1) + 
                                 '-' + wow.getDate()  + ' ' + wow.getHours() +
                                 ':' + wow.getMinutes(),
                series: $('#series').val(),
                sport_id: sportid,
                court_name: court,
                court_location: 'UPLB',
                court_type: courttype
            }
            if(data.match_date_time == undefined || data.series == undefined ||
                data.court_name == undefined){
                swal("Failed!", "Please fill up all fields", "error");
            }
            else if (moment(wow).isBefore(moment($scope.starting_date))) {
                swal("Failed","Match date is before game event starting date.","error");
            }
            else if (moment(wow).isAfter(moment($scope.ending_date))) {
                swal("Failed","Match date is after game event ending date.","error");
            }
            else if(selectedValues.length < 2 ){
                swal("Failed!", "A match needs atleast two teams", "error");
            }
            else{
                SportService
                    .add_match(data)
                    .then(function(res){
                        for(var i = 0; i < selectedValues.length; i++){
                            data = {
                                team_id: selectedValues[i],
                                score: Math.floor(Math.random() * (100 - 0 + 1)) + 0
                            }
                            SportService
                                .add_team_to_match(data)
                                .then(function(res){
                                    $scope.get_matches();
                                }, function(err){
                                    console.log(err)
                                })
                            swal("Success!", "Match has been added", "success");
                        }
                    },function(err){
                        swal("Failure!", "You are not the game head of this game event.", "error");
                        console.log(err);
                    })
            }
            
        }                                

    }
})();
