$(document).ready(function() {
  var current;

  $('.subnav .nav li a').click(function(evt) {
    evt.preventDefault();
    $.scrollTo($(this).attr('href'), 1000, {offset: -90});
  });

  $('.description a').click(function(evt) {
  	// Little hack to let local links work and outbounds do fine.
  	if ($(this).attr('href').substring(0, 1) == "#") {
	    evt.preventDefault();
	    $.scrollTo($(this).attr('href'), 1000, {offset: -90});
	    console.log("was called");
	}
  });
});