# frozen_string_literal: true

require "feature_flags/version"
require "feature_flags/engine"

module FeatureFlags
  def self.config_path
    path = defined?(Rails) ? Rails.root : File
    path.join("config", "feature_flags.yml")
  end

  def self.config
    @config ||= YAML.load(ERB.new(File.read(config_path)).result)
  end
end
