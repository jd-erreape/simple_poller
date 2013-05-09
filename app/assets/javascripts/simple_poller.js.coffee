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



