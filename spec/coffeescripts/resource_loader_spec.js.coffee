describe 'ResourceLoader', ->

  beforeEach ->
    that = @
    @fakeData = {a: 1, b: 2, c: 3};
    @fakeUrl = 'http://www.test.com/ajax'
    spyOn(window.libFuncName, "ajax").andCallFake( (e) ->
      e.success(that.fakeData)
    )

  it 'perform an ajax request for a json and load a resource', ->
    @resource = jasmine.createSpyObj('resource',['load_callback'])
    @resource_loader = new ResourceLoader(@fakeUrl, @resource)
    @resource_loader.load();
    expect(@resource.load_callback).toHaveBeenCalledWith(@fakeData)


