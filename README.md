## Simple Poller

### Introduction

Here goes introduction

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

All contributions are welcomed! :)

In order to install the gem for development you should:

    - git clone the repository
    - create a gemset and run bundle
    - execute guard to compile all the coffeescript into javascript -> bundle exec guard
    - Add jquery 1.9 to public directory
    - execute jasmine to run the tests -> bundle exec rake jasmine (visit localhost:8888)

check https://github.com/jd-erreape/simple_poller/wiki/TODO for things to do



