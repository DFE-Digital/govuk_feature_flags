# frozen_string_literal: true

module FeatureFlags
  class FeatureFlag
    include ActiveModel::Model

    attr_accessor :author, :description, :name

    def feature
      Feature.find_or_initialize_by(name:)
    end

    FEATURES =
      FeatureFlags
        .config
        .fetch("feature_flags", {})
        .to_h do |name, values|
          [
            name,
            FeatureFlag.new(
              author: values["author"],
              description: values["description"],
              name:
            )
          ]
        end
        .with_indifferent_access
        .freeze

    def self.activate(feature_name)
      raise unless FEATURES.key?(feature_name)

      sync_with_database(feature_name, true)
    end

    def self.deactivate(feature_name)
      raise unless FEATURES.key?(feature_name)

      sync_with_database(feature_name, false)
    end

    def self.active?(feature_name)
      raise unless FEATURES.key?(feature_name)

      feature_statuses[feature_name].presence || false
    end

    def self.sync_with_database(feature_name, active)
      feature = Feature.find_or_initialize_by(name: feature_name)
      feature.active = active

      feature.save!
    end

    def self.feature_statuses
      Feature
        .where(name: FEATURES.keys)
        .pluck(:name, :active)
        .to_h
        .with_indifferent_access
    end
  end
end
