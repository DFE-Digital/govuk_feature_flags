# frozen_string_literal: true

class CustomController < ApplicationController
  before_action { flash[:message] = "Custom controller!" }
end
