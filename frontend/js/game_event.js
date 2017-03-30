$(document).ready(function(){
  $('.carousel.carousel-slider').carousel({fullWidth: true});
  $('.modal').modal({
    dismissible: true,
    opacity: 0.5,
    in_duration: 300,
    out_duration: 200,
    starting_top: '4%',
    ending_top: '10%',
  });


  $("#modal1").width($(".modal").width());
  $("#modal1").height($(".modal").height());

  $("#modal2").width($(".modal").width());
  $("#modal2").height($(".modal").height());

  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15 // Creates a dropdown of 15 years to control year
  });

  var offset = 300,
  offset_opacity = 1200,
  scroll_top_duration = 700;

});
