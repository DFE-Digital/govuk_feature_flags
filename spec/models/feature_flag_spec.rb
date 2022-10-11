# frozen_string_literal: true

require "rails_helper"

RSpec.describe FeatureFlags::FeatureFlag do
  describe ".activate" do
    it "activates a feature" do
      expect { described_class.activate("service_open") }.to(
        change { described_class.active?("service_open") }.from(false).to(true)
      )
    end

    it "records the change in the database" do
      feature = create(:feature, name: "service_open", active: false)
      expect { described_class.activate("service_open") }.to(
        change { feature.reload.active }.from(false).to(true)
      )
    end
  end

  describe ".deactivate" do
    it "deactivates a feature" do
      # To avoid flakey tests where activation/deactivation happens at the same time
      travel(5.minutes) { described_class.activate("service_open") }
      expect { described_class.deactivate("service_open") }.to(
        change { described_class.active?("service_open") }.from(true).to(false)
      )
    end

    it "records the change in the database" do
      feature = create(:feature, name: "service_open", active: true)
      expect { described_class.deactivate("service_open") }.to(
        change { feature.reload.active }.from(true).to(false)
      )
    end
  end
end
