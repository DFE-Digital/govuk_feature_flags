# frozen_string_literal: true

module FeatureFlags
  class ApplicationController < ActionController::Base
    layout -> { GovukFeatureFlags.config.fetch("layout", "application") }

    default_form_builder(GOVUKDesignSystemFormBuilder::FormBuilder)
  end
end
