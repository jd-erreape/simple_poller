## Simple Poller

### Introduction

You can use simple_poller to perform a simple long polling from client side to server side into a rails app.
In order to use it, you only will have to define an object with a load callback, specify an url to perform the polling and the timeout you wish.

simple_poller allows you to start, stop or update the timeout for polling. It is a new gem so stay alert for changes and improvements. All contributions are welcomed!

### Getting started

1. Include Simple Poller to your Gemfile if you haven't done yet:

        gem 'simple_poller'

2. At the command prompt, install the gem:

        bundle install

3. Finally, configure your application to use Simple Poller:

        rails g simple_poller:install

That's all!

You can check a sample app visiting https://github.com/jd-erreape/simple_poller_test

### Contributing

Once again, all contributions are welcomed! :)

In order to install the gem for development you should:

    - git clone the repository
    - create a gemset and run bundle
    - execute guard to compile all the coffeescript into javascript -> bundle exec guard
    - Add jquery 1.9 to public directory
    - execute jasmine to run the tests -> bundle exec rake jasmine (visit localhost:8888)

check https://github.com/jd-erreape/simple_poller/wiki/TODO for things to do



