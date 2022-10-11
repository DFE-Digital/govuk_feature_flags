# frozen_string_literal: true

FactoryBot.define do
  factory :feature, class: "FeatureFlags::Feature" do
    name { "feature" }
    active { false }
  end
end
