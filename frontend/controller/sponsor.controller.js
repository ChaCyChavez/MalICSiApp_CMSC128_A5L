'use strict';

(() => {
    angular.module('app')
        .controller('sponsor-controller', sponsor_controller);
    function sponsor_controller($scope, $location, SponsorService) {
        
 
        $scope.view_profile = () => {
            $location.path("/profile").replace();
        }

        $scope.view_user = () => {
            $location.path("/user").replace();
        }

        $scope.logout = () => {
            $location.path("/").replace();
        }

        $scope.back_to_home = () => {
            $location.path("/game-event").replace();
        }
        $scope.get_all_sponsor = function(){
            SponsorService
            .get_all_sponsor()
            .then(function(res){
                $scope.allSponsors = res[0];
                console.log($scope.allSponsors);
                console.log("hello");
            },function(err){
                console.log(err);
            })
        }        
    }
})();
