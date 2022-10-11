# FeatureFlags

A simple implementation of feature flags that are persisted in the database and controlled via
a basic admin UI.

## Installation

1. Add `feature_flags` gem to your `Gemfile`
1. Run `rails feature_flags:install:migrations`
1. Run `rails db:migrate`
1. Mount the engine in the appropriate place in your routes file: eg. `mount FeatureFlags::Engine => "/features"`

## Usage

Define your feature flags in `config/feature_flags.yml`

```yaml
feature_flags:
  service_open:
    author: Your name
    description: Allow users to access the service
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
