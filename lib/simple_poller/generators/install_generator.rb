require 'rails/generators'

module SimplePoller
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_assets
        insert_into_file "app/assets/javascripts/application#{detect_js_format[0]}", "#{detect_js_format[1]} require simple_poller\n", :after => "jquery_ujs\n"
      end

      private

      def detect_js_format
        return ['.coffee', '#='] if File.exist?('app/assets/javascripts/application.coffee')
        return ['.js.coffee', '#='] if File.exist?('app/assets/javascripts/application.js.coffee')
        return ['.js', '//='] if File.exist?('app/assets/javascripts/application.js')
      end

    end
  end
end
