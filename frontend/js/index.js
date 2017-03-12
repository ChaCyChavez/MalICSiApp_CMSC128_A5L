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

  // $(".modal").width($(".modal").width());
  // $(".modal").height($(".modal").height());
});
