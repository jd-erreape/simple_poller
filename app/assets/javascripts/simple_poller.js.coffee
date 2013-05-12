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

class window.ResourceLoader

  constructor: (request_url, resource) ->
    @request_url = request_url
    @resource = resource

  load: ->
    that = @
    $.ajax
      url: this.request_url
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.resource.load_callback(data)
      error: ->
        #TODO Manage error

class window.SimplePoller

  constructor: (resource_loader, timeout) ->
    @resource_loader = resource_loader
    @timeout = timeout
    @clock_id = null

  start: ->
    @clock_id = @poll()
    @add_poller_globally()

  stop: ->
    clearInterval(@clock_id)

  update_timeout: (timeout) ->
    clearInterval(@clock_id)
    @timeout = timeout
    @start()

  # ------- Private -------

  poll: ->
    that = @
    return setInterval(->
      that.resource_loader.load()
    , @timeout)

  add_poller_globally: ->
    window.active_pollers.push(@) if window.active_pollers



