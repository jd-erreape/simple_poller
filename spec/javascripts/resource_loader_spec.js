describe('ResourceLoader', function () {

    var resource_loader;
    var fakeData;
    var fakeUrl;

    beforeEach(function () {
        fakeData = {a: 1, b: 2, c: 3};
        fakeUrl = 'http://www.test.com/ajax'
        spyOn($, "ajax").andCallFake(function (e) {
            e.success(fakeData);
        });

    });

    it('perform an ajax request for a json and load a resource', function () {
        var resource = jasmine.createSpyObj('resource',['load_callback']);
        resource_loader = new ResourceLoader(fakeUrl, resource);
        resource_loader.load();
        expect(resource.load_callback).toHaveBeenCalledWith(fakeData);
    });

});
