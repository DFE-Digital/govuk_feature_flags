# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in feature_flags.gemspec.
gemspec

gem "cssbundling-rails"
gem "govuk-components"
gem "govuk_design_system_formbuilder"
gem "pg"
gem "propshaft"

group :development do
  gem "annotate", require: false
  gem "prettier_print", require: false
  gem "rubocop-govuk", require: false
  gem "syntax_tree", require: false
  gem "syntax_tree-haml", require: false
  gem "syntax_tree-rbs", require: false
  gem "web-console"
end

group :development, :test do
  gem "factory_bot_rails"
end

group :test do
  gem "capybara"
  gem "cuprite"
  gem "puma", "~> 6.1"
  gem "rspec-rails"
  gem "shoulda-matchers"
end
