(function() {
  describe('ResourceLoader', function() {
    beforeEach(function() {
      var that;

      that = this;
      this.fakeData = {
        a: 1,
        b: 2,
        c: 3
      };
      this.fakeUrl = 'http://www.test.com/ajax';
      spyOn(VendoredLib, 'lib').andCallFake(function() {
        return $;
      });
      return spyOn(VendoredLib.lib(), "ajax").andCallFake(function(e) {
        return e.success(that.fakeData);
      });
    });
    return it('perform an ajax request for a json and load a resource', function() {
      this.resource = jasmine.createSpyObj('resource', ['load_callback']);
      this.resource_loader = new ResourceLoader(this.fakeUrl, this.resource);
      this.resource_loader.load();
      return expect(this.resource.load_callback).toHaveBeenCalledWith(this.fakeData);
    });
  });

}).call(this);
