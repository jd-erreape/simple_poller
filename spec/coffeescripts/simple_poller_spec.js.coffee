describe 'A SimplePoller', ->

  beforeEach ->
    @resource_loader = jasmine.createSpyObj('resource_loader',['load'])
    @timeout = 500
    jasmine.Clock.useMock();
    @simple_clock = new SimplePoller(@resource_loader, @timeout)

  it 'will load a resource given a timeout', ->
    @simple_clock.start()
    expect(@resource_loader.load).not.toHaveBeenCalled()
    jasmine.Clock.tick((@timeout*2)+1)
    expect(@resource_loader.load.callCount).toBe(2)

  it 'will stop the load', ->
    @simple_clock.start()
    jasmine.Clock.tick(@timeout+1)
    expect(@resource_loader.load.callCount).toBe(1)
    @simple_clock.stop()
    jasmine.Clock.tick(@timeout+1)
    expect(@resource_loader.load.callCount).toBe(1)

  it 'will update the timeout', ->
    @simple_clock.start()
    jasmine.Clock.tick(@timeout+1)
    expect(@resource_loader.load.callCount).toBe(1)
    @simple_clock.update_timeout(@timeout/2)
    jasmine.Clock.tick(@timeout)
    expect(@resource_loader.load.callCount).toBe(3)

describe 'Two SimplePollers', ->

  beforeEach ->
    @resource_loader_1 = jasmine.createSpyObj('resource_loader',['load'])
    @resource_loader_2 = jasmine.createSpyObj('resource_loader',['load'])
    @timeout = 500
    jasmine.Clock.useMock();
    @simple_poller_1 = new SimplePoller(@resource_loader_1, @timeout)
    @simple_poller_2 = new SimplePoller(@resource_loader_2, @timeout)

  it 'will start independently', ->
    @simple_poller_1.start()
    @simple_poller_2.start()
    jasmine.Clock.tick(@timeout+1)
    expect(@resource_loader_1.load.callCount).toBe(1)
    expect(@resource_loader_2.load.callCount).toBe(1)

  it 'will stop independently', ->
    @simple_poller_1.start()
    jasmine.Clock.tick(@timeout+1)
    expect(@resource_loader_1.load.callCount).toBe(1)
    expect(@resource_loader_2.load).not.toHaveBeenCalled()
    @simple_poller_1.stop()
    @simple_poller_2.start()
    jasmine.Clock.tick(@timeout+1)
    expect(@resource_loader_1.load.callCount).toBe(1)
    expect(@resource_loader_2.load.callCount).toBe(1)

  it 'will update timeouts independently', ->
    @simple_poller_1.update_timeout(@timeout/2)
    @simple_poller_2.start()
    jasmine.Clock.tick(@timeout+1)
    expect(@resource_loader_1.load.callCount).toBe(2)
    expect(@resource_loader_2.load.callCount).toBe(1)


