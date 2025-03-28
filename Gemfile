source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.1"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Using act_as_paranoid for soft delete
# https://github.com/ActsAsParanoid/acts_as_paranoid
gem "acts_as_paranoid", "~> 0.10.3"

# Using devise for authentication
# https://github.com/heartcombo/devise
gem "devise", "~> 4.9"

# Using pundit for minimal autorizations and permissions
# https://github.com/varvet/pundit
gem "pundit", "~> 2.5"

# using lograge and/or ougai to have better logging structure
# https://github.com/roidrage/lograge
gem "lograge"
# https://github.com/tilfin/ougai
gem "ougai"

# using papertrail for db audits
# https://github.com/paper-trail-gem/paper_trail
gem "paper_trail"

# using sidekiq for async jobs
# https://github.com/sidekiq/sidekiq
gem "sidekiq", "~> 8.0"
gem "sidekiq-cron"
gem "sidekiq-scheduler", "~> 4.0"

# adding rswag for api docs
# https://github.com/rswag/rswag
gem "rswag"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # Rspec Ruby testing [https://github.com/rspec/rspec-rails]
  gem "rspec-rails", "~> 7.0.0"
  gem "rails-controller-testing"

  # adding factory bot for model generation in tests
  # https://github.com/thoughtbot/factory_bot
  # gem "factory_bot", "~> 6.5"
  gem "factory_bot_rails"
  # https://github.com/thoughtbot/shoulda-matchers
  gem "shoulda-matchers", "~> 6.0"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Using bullet to fix N+1
  # https://github.com/flyerhzm/bullet
  gem "bullet"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end
