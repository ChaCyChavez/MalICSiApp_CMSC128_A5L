$(document).ready(function(){
  $('.carousel.carousel-slider').carousel({fullWidth: true});
  $('.modal').modal({
    // size: 'small',
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

});
