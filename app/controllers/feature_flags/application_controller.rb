# frozen_string_literal: true

module FeatureFlags
  class ApplicationController < ActionController::Base
    layout -> { GovukFeatureFlags.config.fetch("layout", "application") }
    helper all_helpers_from_path "app/helpers"

    default_form_builder(GOVUKDesignSystemFormBuilder::FormBuilder)
  end
end
