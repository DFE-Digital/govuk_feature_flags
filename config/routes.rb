# frozen_string_literal: true

FeatureFlags::Engine.routes.draw do
  resources :feature_flags, only: [:index] do
    member do
      patch :activate
      patch :deactivate
    end
  end

  root to: "feature_flags#index"
end
