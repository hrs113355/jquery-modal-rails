module Jquery
  module Modal
    module Rails
      class Engine < ::Rails::Engine
        config.generators do |g|
          g.test_framework :rspec
          g.integration_tool :rspec
        end

        initializer 'jquery-modal-rails.assets.precompile' do |app|
          app.config.assets.precompile << Proc.new do |path, fname|
            fname =~ /vendor\/assets\/(images|fonts)\/jquery-modal-rails/ && !%w(.js .css).include?(File.extname(path))
          end
        end
      end
    end
  end
end
