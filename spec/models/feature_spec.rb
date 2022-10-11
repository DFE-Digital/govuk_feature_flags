# frozen_string_literal: true

require "rails_helper"

RSpec.describe FeatureFlags::Feature, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }

    context "with an existing feature" do
      before { create(:feature) }

      it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
    end
  end
end
