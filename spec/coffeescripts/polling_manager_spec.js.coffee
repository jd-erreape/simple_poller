describe 'Polling Manager Functions', ->

  beforeEach ->
    @resource_loader_1 = jasmine.createSpyObj('resource_loader',['load'])
    @resource_loader_2 = jasmine.createSpyObj('resource_loader',['load'])
    @timeout = 500
    jasmine.Clock.useMock();
    @simple_poller_1 = new SimplePoller(@resource_loader_1, @timeout)
    @simple_poller_2 = new SimplePoller(@resource_loader_2, @timeout)

  it 'can delete all the pollers', ->
    @simple_poller_1.start()
    @simple_poller_2.start()
    expect(window.active_pollers.length).toBe(2)
    window.stop_all_pollers()
    expect(window.active_pollers.length).toBe(0)

  it 'can stop all the pollers', ->
    @simple_poller_1.start()
    @simple_poller_2.start()
    jasmine.Clock.tick(@timeout+1)
    expect(@resource_loader_1.load.callCount).toBe(1)
    expect(@resource_loader_2.load.callCount).toBe(1)
    window.stop_all_pollers()
    jasmine.Clock.tick(@timeout+1)
    expect(@resource_loader_1.load.callCount).toBe(1)
    expect(@resource_loader_2.load.callCount).toBe(1)
