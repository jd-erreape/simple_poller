require "simple_poller/version"

if defined?(Rails)
  require "simple_poller/generators/install_generator"
end

module SimplePoller
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end
