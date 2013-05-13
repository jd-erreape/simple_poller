require "simple_poller/version"

if defined?(Rails)
  require "simple_poller/generators/install_generator"
end

module SimplePoller
  require "simple_poller/engine" if defined?(Rails)
end
