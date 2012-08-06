# application code goes here.
$ ->
 	# navigation
  current = 'home'
  $('.nav li a').click (evt) ->
    link = $(evt.target)
    if target = link.data('target')
      # don't follow #hash, but make sure it's set in the location
      evt.preventDefault()
  
      # set active
      $('.nav li').removeClass 'active'
      link.closest('li').addClass 'active'
  
      # scroll to
      if $("##{target}").length > 0
        currentScroll = $('body').scrollTop()
        window.location.hash = target
        $('html, body').scrollTop(currentScroll)
  
        $('html, body').animate
          scrollTop: $("##{target}").offset().top - 70
        , 1000
      else