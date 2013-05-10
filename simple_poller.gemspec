# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "simple_poller/version"

Gem::Specification.new do |s|
  s.name        = "simple_poller"
  s.version     = SimplePoller::VERSION
  s.authors     = ["jd-erreape"]
  s.email       = ["juandediosherrero@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Write a gem summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "simple_poller"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-coffeescript'
  s.add_development_dependency 'jasmine'
  # s.add_runtime_dependency "rest-client"
  s.add_dependency 'railties', '~> 3.1'

end
