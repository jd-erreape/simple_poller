describe 'The vendored lib', ->

  it 'fails if there is no lib defined', ->
    spyOn(VendoredLib,'libs').andCallFake(-> [])
    -> expect(VendoredLib.lib()).toThrow(new TypeError())

  it 'return the first lib that is available', ->
    spyOn(VendoredLib,'libs').andCallFake(-> [jQuery,$])
    expect(VendoredLib.lib()).toBe(jQuery)
