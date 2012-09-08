$(document).ready(function() {
  var current;

  $('.subnav .nav li a').click(function(evt) {
    evt.preventDefault();
    $.scrollTo($(this).attr('href'), 1000, {offset: -90});
  });

  $('.description a').click(function(evt) {
    evt.preventDefault();
    $.scrollTo($(this).attr('href'), 1000, {offset: -90});
    console.log("was called");
  });
});