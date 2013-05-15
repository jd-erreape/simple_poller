#***** TURBOLINKS COMPATIBILITY **************

#$(window).bind('page:fetch', function () {
#    stop_all_pollers();
#});

#***** END TURBOLINKS COMPATIBILITY **************

#Global Clocks Array
window.active_pollers = []

window.stop_all_pollers = ->
  for poller in window.active_pollers
    clearInterval(poller.clock_id)
  window.active_pollers = []