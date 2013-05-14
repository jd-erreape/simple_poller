#***** TURBOLINKS COMPATIBILITY **************

#$(window).bind('page:fetch', function () {
#    stop_all_pollers();
#});

#***** END TURBOLINKS COMPATIBILITY **************

# Accommodate running jQuery or Zepto in noConflict() mode by
# using an anonymous function to redefine the $ shorthand name.
# See http://docs.jquery.com/Using_jQuery_with_Other_Libraries
# and http://zeptojs.com/
window.vendoredLib = ->
  if typeof jQuery is "undefined" && typeof Zepto is "undefined" && typeof $ is "function"
    return $
  else if typeof jQuery is "function"
    return jQuery
  else if typeof Zepto is "function"
    return Zepto
  else
    return null

window.libFuncName = window.vendoredLib()
throw new TypeError() if window.libFuncName is null

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
    window.libFuncName.ajax
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



