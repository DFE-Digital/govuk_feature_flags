# frozen_string_literal: true

module FeatureFlags
  class ApplicationController < ActionController::Base
    default_form_builder(GOVUKDesignSystemFormBuilder::FormBuilder)
  end
end
