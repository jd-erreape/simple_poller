/***** TURBOLINKS COMPATIBILITY **************/

//$(window).bind('page:fetch', function () {
//    stop_all_timers();
//});
//
//function stop_all_timers() {
//    for (var i = 0; i < window.timeouts.length; i++) {
//        //Probamos a borrar tanto el timeout como el interval
//        clearInterval(window.timeouts[i]);
//        clearTimeout(window.timeouts[i]);
//    }
//    window.timeouts = [];
//}

/***** END TURBOLINKS COMPATIBILITY **************/

window.active_clocks = []

function resource_retriever(request_url) {
    this.request_url = request_url;
    this.retrieved_json = null;

    this.load = function (run_load_callback) {
        var that = this;
        $.ajax({
            type: "GET",
            dataType: "json",
            url: this.request_url,
            success: function (data) {
                that.json_representation = data;
                if (run_load_callback) {
                    that.run_load_callback();
                }
            },
            error: function () {
                //TODO Manage error
            }
        });
    };

    this.run_load_callback = function () {
        if ('load_callback' in this) {
            this.load_callback();
        }
    };

}

function simple_clock(resource_retriever, timeout) {

    this.resource_retriever = resource_retriever;
    this.timeout = timeout;
    this.position_in_interval_array = null;

    this.start = function () {
        this.resource_retriever.clock_object = this;
        var that = this;
        this.position_in_interval_array = window.active_clocks.push(setInterval(function () {
            that.resource_retriever.load();
            that.resource_retriever.run_load_callback();
        }, this.timeout));
    };

    this.stop = function () {
        clearInterval(window.active_clocks[this.position_in_interval_array - 1]);
    };

    this.update_timeout = function (new_timeout) {
        clearInterval(window.active_clocks[this.position_in_interval_array - 1]);
        this.timeout = new_timeout;
        this.start();
    };

}


