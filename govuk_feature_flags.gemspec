# frozen_string_literal: true

require_relative "lib/feature_flags/version"

Gem::Specification.new do |spec|
  spec.name = "govuk_feature_flags"
  spec.version = FeatureFlags::VERSION
  spec.authors = ["Felix Clack"]
  spec.email = ["felix.clack@digital.education.gov.uk"]
  spec.homepage = "https://github.com/DFEDigital/refer-serious-misconduct"
  spec.summary = "Summary of FeatureFlags."
  spec.description = "Description of FeatureFlags."

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata[
    "source_code_uri"
  ] = "https://github.com/DFEDigital/refer-serious-misconduct"
  spec.metadata[
    "changelog_uri"
  ] = "https://github.com/DFEDigital/refer-serious-misconduct/blob/master/CHANGELOG.md"

  spec.files =
    Dir.chdir(File.expand_path(__dir__)) do
      Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
    end
  spec.test_files = Dir["spec/**/*"]

  spec.add_dependency "rails", ">= 7.0.4"
  spec.add_development_dependency "cssbundling-rails"
  spec.add_development_dependency "rubocop-govuk"
end
