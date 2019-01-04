$(document).ready(function() {

  // Check for click events on the navbar burger icon
  $(".navbar-burger").click(function() {

      // Toggle the "is-active" class on both the "navbar-burger" and the "navbar-menu"
      $(".navbar-burger").toggleClass("is-active");
      $(".navbar-menu").toggleClass("is-active");

  });
});

//Headroom Config

// grab an element
var elem = document.querySelector("nav");
// construct an instance of Headroom, passing the element

var headroom = new Headroom(elem);

// initialise
headroom.init(); 


// Scroll Reveal Script
sr.reveal('.img-reveal', { duration: 1500 });

