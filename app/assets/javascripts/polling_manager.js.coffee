/***** TURBOLINKS COMPATIBILITY **************/

#$(window).bind('page:fetch', function () {
#    stop_all_timers();
#});
#
#function stop_all_timers() {
#    for (var i = 0; i < window.timeouts.length; i++) {
#        //Probamos a borrar tanto el timeout como el interval
#        clearInterval(window.timeouts[i]);
#        clearTimeout(window.timeouts[i]);
#    }
#    window.timeouts = [];
#}

/***** END TURBOLINKS COMPATIBILITY **************/

window.active_clocks = []

class window.ResourceRetriever

  constructor: (request_url) ->
    @request_url = request_url
    @retrieved_json = null;

  load: (run_load_callback) ->
    that = @
    $.ajax @request_url,
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.retrieved_json = data
        that.run_load_callback() if run_load_callback
      error: ->
        #TODO Manage error

  run_load_callback: ->
    @load_callback() if @load_callback

class window.SimpleClock

  constructor: (resource_retriever, timeout) ->
    @resource_retriever = resource_retriever
    @timeout = timeout
    @position_in_interval_array = null


  start: ->
    @resource_retriever.clock_object = @
    that = @
    @position_in_interval_array = window.active_clocks.push(setInterval( ->
      that.resource_retriever.load()
      that.resource_retriever.run_load_callback()
    , @timeout))

  stop: ->
    clearInterval(window.active_clocks[@position_in_interval_array - 1])

  update_timeout: (new_timeout) ->
    clearInterval(window.active_clocks[this.position_in_interval_array - 1])
    @timeout = new_timeout
    @start()


