document.addEventListener("DOMContentLoaded", function(){
  $(".nav a").on("click", function(){
     $(".nav").find(".active").removeClass("active");
     $(this).parent().addClass("active");
  });
  $("#sendurl").submit(function(e) {
    e.preventDefault();
  });
});