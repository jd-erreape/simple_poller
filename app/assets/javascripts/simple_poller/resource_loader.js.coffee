class window.ResourceLoader

  constructor: (request_url, resource) ->
    @request_url = request_url
    @resource = resource

  load: ->
    that = @
    VendoredLib.lib().ajax
      url: this.request_url
      type: 'GET'
      dataType: 'JSON'
      success: (data) ->
        that.resource.load_callback(data)
      error: ->
        #TODO Manage error