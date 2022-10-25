# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Feature Flags", type: :system do
  it "using the interface" do
    given_there_is_a_feature
    when_i_visit_the_feature_flags_page
    then_i_see_the_feature_flags

    when_i_activate_the_service_open_feature_flag
    then_the_service_open_flag_is_on

    when_i_deactivate_the_service_open_feature_flag
    then_the_service_open_flag_is_off
  end

  it "customising the layout" do
    given_i_configured_a_custom_layout
    when_i_visit_the_feature_flags_page
    then_i_see_the_custom_layout
  end

  it "customising parent_controller" do
    given_i_configured_a_custom_parent_controller
    when_i_visit_the_feature_flags_page
    then_custom_controller_behaviours_are_triggered
  end

  private

  def given_there_is_a_feature
    create(:feature)
  end

  def given_i_configured_a_custom_parent_controller
    GovukFeatureFlags.config = { "parent_controller" => "CustomController" }
  end

  def then_custom_controller_behaviours_are_triggered
    expect(page).to have_content("Custom controller!")
  end

  def given_i_configured_a_custom_layout
    GovukFeatureFlags.config = { "layout" => "custom" }
  end

  def when_i_visit_the_feature_flags_page
    visit feature_flags.root_path
  end

  def when_i_activate_the_service_open_feature_flag
    click_on "Activate Service open"
  end

  def when_i_deactivate_the_service_open_feature_flag
    click_on "Deactivate Service open"
  end

  def then_i_see_the_custom_layout
    expect(page).to have_content("Custom layout")
  end

  def then_i_see_the_feature_flags
    expect(page).to have_content("Features")
  end

  def then_the_service_open_flag_is_on
    expect(page).to have_content("Feature “Service open” activated")
    expect(page).to have_content("Service open - Active")
  end

  def then_the_service_open_flag_is_off
    expect(page).to have_content("Feature “Service open” deactivated")
    expect(page).to have_content("Service open - Inactive")
  end
end
