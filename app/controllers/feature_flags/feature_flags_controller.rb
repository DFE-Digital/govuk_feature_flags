# frozen_string_literal: true

module FeatureFlags
  class FeatureFlagsController < ApplicationController
    def index
      @features = FeatureFlags::FeatureFlag::FEATURES
    end

    def activate
      FeatureFlags::FeatureFlag.activate(params[:id])

      flash[:success] = "Feature “#{feature_name}” activated"
      redirect_to root_path
    end

    def deactivate
      FeatureFlags::FeatureFlag.deactivate(params[:id])

      flash[:success] = "Feature “#{feature_name}” deactivated"
      redirect_to root_path
    end

    private

    def feature_name
      params[:id].humanize
    end
  end
end
