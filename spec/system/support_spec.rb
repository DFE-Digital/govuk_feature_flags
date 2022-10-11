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

  private

  def given_there_is_a_feature
    create(:feature)
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

  def then_i_see_the_feature_flags
    expect(page).to have_content("Features")
  end

  def then_the_service_open_flag_is_on
    expect(page).to have_content("Feature “Service open” activated")
    expect(page).to have_content("Service open\n- Active")
  end

  def then_the_service_open_flag_is_off
    expect(page).to have_content("Feature “Service open” deactivated")
    expect(page).to have_content("Service open\n- Inactive")
  end
end
