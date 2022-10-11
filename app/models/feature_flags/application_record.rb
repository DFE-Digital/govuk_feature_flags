# frozen_string_literal: true

module FeatureFlags
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
