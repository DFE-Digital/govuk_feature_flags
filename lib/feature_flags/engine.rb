# frozen_string_literal: true

begin
  require "factory_bot_rails"
rescue LoadError
end

module FeatureFlags
  class Engine < ::Rails::Engine
    isolate_namespace FeatureFlags

    if defined?(FactoryBotRails)
      config.factory_bot.definition_file_paths += [
        File.expand_path("../../spec/factories", __dir__)
      ]
    end
  end
end
