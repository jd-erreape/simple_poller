# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "polling_manager/version"

Gem::Specification.new do |s|
  s.name        = "polling_manager"
  s.version     = PollingManager::VERSION
  s.authors     = ["jd-erreape"]
  s.email       = ["juandediosherrero@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Write a gem summary}
  s.description = %q{Write a gem description}

  s.rubyforge_project = "polling_manager"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_runtime_dependency 'jquery-rails'
end
