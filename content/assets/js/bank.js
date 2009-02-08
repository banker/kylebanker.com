$(document).ready(function(){
  $("#content h1").animate({fontSize:"5em"}, 300, function(){
    $("#links").show();  
    $("#links").animate({fontSize:"2em"}, 200);
  });
});
