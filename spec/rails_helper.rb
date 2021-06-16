# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end
end
VCR.configure do |config|
  config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  config.hook_into :webmock
  config.filter_sensitive_data('<weather>') { ENV['weather'] }
  config.filter_sensitive_data('<mq>') { ENV['mq'] }
  config.configure_rspec_metadata!
  # This line lets cassettes re-record as needed
  # config.default_cassette_options = { record: :new_episodes, re_record_interval: 7.days }
end

def current_weather_data
  {
    "lat": 39.7385,
    "lon": -104.9849,
    "timezone": "America/Denver",
    "timezone_offset": -21600,
    "current": {
        "dt": 1623701371,
        "sunrise": 1623670286,
        "sunset": 1623724156,
        "temp": 94.33,
        "feels_like": 92.19,
        "pressure": 1011,
        "humidity": 26,
        "dew_point": 54.19,
        "uvi": 11.26,
        "clouds": 0,
        "visibility": 10000,
        "wind_speed": 1.01,
        "wind_deg": 355,
        "wind_gust": 3,
        "weather": [
            {
                "id": 800,
                "main": "Clear",
                "description": "clear sky",
                "icon": "01d"
            }
        ]
    },
    "hourly": [
        {
            "dt": 1623700800,
            "temp": 94.33,
            "feels_like": 92.19,
            "pressure": 1011,
            "humidity": 26,
            "dew_point": 54.19,
            "uvi": 11.26,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 7.85,
            "wind_deg": 61,
            "wind_gust": 8.88,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623704400,
            "temp": 95.25,
            "feels_like": 92.23,
            "pressure": 1010,
            "humidity": 22,
            "dew_point": 50.43,
            "uvi": 9.23,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 9.66,
            "wind_deg": 70,
            "wind_gust": 10.31,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623708000,
            "temp": 96.21,
            "feels_like": 92.39,
            "pressure": 1010,
            "humidity": 18,
            "dew_point": 45.86,
            "uvi": 6.51,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 10.31,
            "wind_deg": 74,
            "wind_gust": 10.78,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623711600,
            "temp": 96.85,
            "feels_like": 92.5,
            "pressure": 1009,
            "humidity": 15,
            "dew_point": 41.61,
            "uvi": 3.81,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 10.4,
            "wind_deg": 77,
            "wind_gust": 10.13,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623715200,
            "temp": 96.44,
            "feels_like": 91.92,
            "pressure": 1009,
            "humidity": 14,
            "dew_point": 39.51,
            "uvi": 1.74,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 9.55,
            "wind_deg": 102,
            "wind_gust": 8.57,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623718800,
            "temp": 94.32,
            "feels_like": 90.09,
            "pressure": 1008,
            "humidity": 16,
            "dew_point": 40.55,
            "uvi": 0.56,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 10.6,
            "wind_deg": 141,
            "wind_gust": 9.66,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623722400,
            "temp": 90.36,
            "feels_like": 86.67,
            "pressure": 1009,
            "humidity": 20,
            "dew_point": 43.25,
            "uvi": 0,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 9.64,
            "wind_deg": 170,
            "wind_gust": 15.46,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623726000,
            "temp": 85.95,
            "feels_like": 82.98,
            "pressure": 1011,
            "humidity": 23,
            "dew_point": 43.97,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 8.05,
            "wind_deg": 177,
            "wind_gust": 17.34,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623729600,
            "temp": 83.75,
            "feels_like": 81.46,
            "pressure": 1012,
            "humidity": 26,
            "dew_point": 44.8,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 8.28,
            "wind_deg": 190,
            "wind_gust": 21.68,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623733200,
            "temp": 81.79,
            "feels_like": 80.11,
            "pressure": 1012,
            "humidity": 27,
            "dew_point": 44.65,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 6.98,
            "wind_deg": 196,
            "wind_gust": 21.12,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623736800,
            "temp": 80.02,
            "feels_like": 79.14,
            "pressure": 1012,
            "humidity": 29,
            "dew_point": 44.62,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 6.08,
            "wind_deg": 187,
            "wind_gust": 15.3,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623740400,
            "temp": 78.31,
            "feels_like": 77.25,
            "pressure": 1012,
            "humidity": 30,
            "dew_point": 44.11,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 4.25,
            "wind_deg": 197,
            "wind_gust": 7.52,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623744000,
            "temp": 77.05,
            "feels_like": 75.83,
            "pressure": 1013,
            "humidity": 29,
            "dew_point": 41.67,
            "uvi": 0,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 2.15,
            "wind_deg": 266,
            "wind_gust": 4.29,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623747600,
            "temp": 75.79,
            "feels_like": 74.34,
            "pressure": 1013,
            "humidity": 27,
            "dew_point": 39.2,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.3,
            "wind_deg": 242,
            "wind_gust": 3.02,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623751200,
            "temp": 74.52,
            "feels_like": 72.99,
            "pressure": 1014,
            "humidity": 28,
            "dew_point": 38.39,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 4,
            "wind_deg": 261,
            "wind_gust": 5.14,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623754800,
            "temp": 73.45,
            "feels_like": 71.87,
            "pressure": 1014,
            "humidity": 29,
            "dew_point": 38.66,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 4.43,
            "wind_deg": 232,
            "wind_gust": 4.61,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623758400,
            "temp": 72.77,
            "feels_like": 71.15,
            "pressure": 1014,
            "humidity": 30,
            "dew_point": 39.74,
            "uvi": 0,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 4.12,
            "wind_deg": 209,
            "wind_gust": 4.34,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623762000,
            "temp": 75.22,
            "feels_like": 73.8,
            "pressure": 1015,
            "humidity": 29,
            "dew_point": 40.78,
            "uvi": 0.54,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 2.98,
            "wind_deg": 212,
            "wind_gust": 3.69,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623765600,
            "temp": 79.43,
            "feels_like": 79.43,
            "pressure": 1015,
            "humidity": 25,
            "dew_point": 40.57,
            "uvi": 1.69,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 0.98,
            "wind_deg": 242,
            "wind_gust": 2.1,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623769200,
            "temp": 82.4,
            "feels_like": 80.29,
            "pressure": 1015,
            "humidity": 23,
            "dew_point": 40.46,
            "uvi": 3.7,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 6.08,
            "wind_deg": 33,
            "wind_gust": 5.39,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623772800,
            "temp": 85.01,
            "feels_like": 82.15,
            "pressure": 1014,
            "humidity": 22,
            "dew_point": 41.65,
            "uvi": 6.35,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 6.15,
            "wind_deg": 16,
            "wind_gust": 4.29,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623776400,
            "temp": 88.93,
            "feels_like": 85.26,
            "pressure": 1014,
            "humidity": 19,
            "dew_point": 40.73,
            "uvi": 9.02,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 3.51,
            "wind_deg": 11,
            "wind_gust": 1.59,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623780000,
            "temp": 92.73,
            "feels_like": 88.54,
            "pressure": 1012,
            "humidity": 16,
            "dew_point": 39.47,
            "uvi": 11.01,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.64,
            "wind_deg": 71,
            "wind_gust": 5.28,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623783600,
            "temp": 96.03,
            "feels_like": 91.27,
            "pressure": 1011,
            "humidity": 12,
            "dew_point": 36.12,
            "uvi": 11.74,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 7.29,
            "wind_deg": 71,
            "wind_gust": 5.99,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623787200,
            "temp": 97.81,
            "feels_like": 92.73,
            "pressure": 1010,
            "humidity": 10,
            "dew_point": 32.16,
            "uvi": 11.02,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 8.81,
            "wind_deg": 68,
            "wind_gust": 6.42,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623790800,
            "temp": 98.71,
            "feels_like": 93.43,
            "pressure": 1009,
            "humidity": 9,
            "dew_point": 30.56,
            "uvi": 9.03,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 10.22,
            "wind_deg": 63,
            "wind_gust": 8.14,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623794400,
            "temp": 98.74,
            "feels_like": 93.47,
            "pressure": 1009,
            "humidity": 9,
            "dew_point": 29.62,
            "uvi": 6.28,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 11.54,
            "wind_deg": 60,
            "wind_gust": 8.59,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623798000,
            "temp": 98.02,
            "feels_like": 92.82,
            "pressure": 1009,
            "humidity": 9,
            "dew_point": 29.46,
            "uvi": 3.68,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 12.26,
            "wind_deg": 59,
            "wind_gust": 7.83,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623801600,
            "temp": 96.73,
            "feels_like": 91.74,
            "pressure": 1009,
            "humidity": 10,
            "dew_point": 30.16,
            "uvi": 1.69,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 11.61,
            "wind_deg": 72,
            "wind_gust": 8.81,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0.04
        },
        {
            "dt": 1623805200,
            "temp": 92.12,
            "feels_like": 87.96,
            "pressure": 1010,
            "humidity": 16,
            "dew_point": 38.05,
            "uvi": 0.55,
            "clouds": 8,
            "visibility": 10000,
            "wind_speed": 11.74,
            "wind_deg": 129,
            "wind_gust": 14.23,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0.09
        },
        {
            "dt": 1623808800,
            "temp": 84.15,
            "feels_like": 81.93,
            "pressure": 1012,
            "humidity": 28,
            "dew_point": 47.19,
            "uvi": 0,
            "clouds": 20,
            "visibility": 10000,
            "wind_speed": 12.44,
            "wind_deg": 179,
            "wind_gust": 21.25,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0.05
        },
        {
            "dt": 1623812400,
            "temp": 81.79,
            "feels_like": 80.33,
            "pressure": 1013,
            "humidity": 30,
            "dew_point": 46.87,
            "uvi": 0,
            "clouds": 46,
            "visibility": 10000,
            "wind_speed": 10.25,
            "wind_deg": 177,
            "wind_gust": 16.71,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0.05
        },
        {
            "dt": 1623816000,
            "temp": 80.94,
            "feels_like": 79.84,
            "pressure": 1013,
            "humidity": 31,
            "dew_point": 47.14,
            "uvi": 0,
            "clouds": 38,
            "visibility": 10000,
            "wind_speed": 7.67,
            "wind_deg": 187,
            "wind_gust": 12.08,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623819600,
            "temp": 80.64,
            "feels_like": 79.65,
            "pressure": 1013,
            "humidity": 31,
            "dew_point": 46.56,
            "uvi": 0,
            "clouds": 31,
            "visibility": 10000,
            "wind_speed": 5.93,
            "wind_deg": 195,
            "wind_gust": 10.25,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623823200,
            "temp": 79.36,
            "feels_like": 79.36,
            "pressure": 1013,
            "humidity": 30,
            "dew_point": 45,
            "uvi": 0,
            "clouds": 43,
            "visibility": 10000,
            "wind_speed": 5.64,
            "wind_deg": 198,
            "wind_gust": 9.35,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623826800,
            "temp": 78.3,
            "feels_like": 77.18,
            "pressure": 1013,
            "humidity": 29,
            "dew_point": 43.09,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 6.17,
            "wind_deg": 197,
            "wind_gust": 10.04,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623830400,
            "temp": 77,
            "feels_like": 75.81,
            "pressure": 1013,
            "humidity": 30,
            "dew_point": 42.58,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 5.46,
            "wind_deg": 209,
            "wind_gust": 8.75,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623834000,
            "temp": 75.9,
            "feels_like": 74.64,
            "pressure": 1013,
            "humidity": 31,
            "dew_point": 42.85,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 5.28,
            "wind_deg": 218,
            "wind_gust": 7,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623837600,
            "temp": 75,
            "feels_like": 73.71,
            "pressure": 1013,
            "humidity": 32,
            "dew_point": 42.46,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 5.64,
            "wind_deg": 206,
            "wind_gust": 7.07,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623841200,
            "temp": 74.07,
            "feels_like": 72.63,
            "pressure": 1013,
            "humidity": 31,
            "dew_point": 41.23,
            "uvi": 0,
            "clouds": 100,
            "visibility": 10000,
            "wind_speed": 6.26,
            "wind_deg": 211,
            "wind_gust": 9.22,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623844800,
            "temp": 73.85,
            "feels_like": 72.25,
            "pressure": 1013,
            "humidity": 28,
            "dew_point": 38.46,
            "uvi": 0,
            "clouds": 96,
            "visibility": 10000,
            "wind_speed": 6.46,
            "wind_deg": 211,
            "wind_gust": 9.89,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623848400,
            "temp": 76.39,
            "feels_like": 74.89,
            "pressure": 1013,
            "humidity": 25,
            "dew_point": 37.13,
            "uvi": 0.53,
            "clouds": 36,
            "visibility": 10000,
            "wind_speed": 5.77,
            "wind_deg": 212,
            "wind_gust": 9.98,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623852000,
            "temp": 81.66,
            "feels_like": 79.65,
            "pressure": 1013,
            "humidity": 20,
            "dew_point": 36.37,
            "uvi": 1.66,
            "clouds": 48,
            "visibility": 10000,
            "wind_speed": 5.19,
            "wind_deg": 218,
            "wind_gust": 7.43,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623855600,
            "temp": 87.62,
            "feels_like": 83.98,
            "pressure": 1012,
            "humidity": 16,
            "dew_point": 35.64,
            "uvi": 3.63,
            "clouds": 53,
            "visibility": 10000,
            "wind_speed": 3.33,
            "wind_deg": 224,
            "wind_gust": 4.65,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623859200,
            "temp": 92.57,
            "feels_like": 88.18,
            "pressure": 1011,
            "humidity": 13,
            "dew_point": 34.61,
            "uvi": 6.04,
            "clouds": 41,
            "visibility": 10000,
            "wind_speed": 0.36,
            "wind_deg": 274,
            "wind_gust": 1.99,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623862800,
            "temp": 95.94,
            "feels_like": 91.11,
            "pressure": 1011,
            "humidity": 11,
            "dew_point": 32.14,
            "uvi": 8.58,
            "clouds": 52,
            "visibility": 10000,
            "wind_speed": 4.72,
            "wind_deg": 49,
            "wind_gust": 5.41,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623866400,
            "temp": 98.44,
            "feels_like": 93.18,
            "pressure": 1010,
            "humidity": 9,
            "dew_point": 29.89,
            "uvi": 10.46,
            "clouds": 59,
            "visibility": 10000,
            "wind_speed": 10.27,
            "wind_deg": 53,
            "wind_gust": 13.42,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1623870000,
            "temp": 99.52,
            "feels_like": 94.15,
            "pressure": 1009,
            "humidity": 9,
            "dew_point": 30.29,
            "uvi": 8.49,
            "clouds": 13,
            "visibility": 10000,
            "wind_speed": 10.92,
            "wind_deg": 68,
            "wind_gust": 14.99,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0
        }
    ],
    "daily": [
        {
            "dt": 1623697200,
            "sunrise": 1623670286,
            "sunset": 1623724156,
            "moonrise": 1623683340,
            "moonset": 0,
            "moon_phase": 0.14,
            "temp": {
                "day": 94.8,
                "min": 68.61,
                "max": 96.85,
                "night": 81.79,
                "eve": 94.32,
                "morn": 71.15
            },
            "feels_like": {
                "day": 91.96,
                "night": 80.11,
                "eve": 90.09,
                "morn": 70.27
            },
            "pressure": 1011,
            "humidity": 23,
            "dew_point": 51.26,
            "wind_speed": 10.6,
            "wind_deg": 141,
            "wind_gust": 21.68,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 12
        },
        {
            "dt": 1623783600,
            "sunrise": 1623756687,
            "sunset": 1623810579,
            "moonrise": 1623773580,
            "moonset": 1623737100,
            "moon_phase": 0.17,
            "temp": {
                "day": 96.03,
                "min": 72.77,
                "max": 98.74,
                "night": 80.64,
                "eve": 92.12,
                "morn": 75.22
            },
            "feels_like": {
                "day": 91.27,
                "night": 79.65,
                "eve": 87.96,
                "morn": 73.8
            },
            "pressure": 1011,
            "humidity": 12,
            "dew_point": 36.12,
            "wind_speed": 12.44,
            "wind_deg": 179,
            "wind_gust": 21.25,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0.09,
            "uvi": 11.74
        },
        {
            "dt": 1623870000,
            "sunrise": 1623843090,
            "sunset": 1623897001,
            "moonrise": 1623864000,
            "moonset": 1623825420,
            "moon_phase": 0.2,
            "temp": {
                "day": 99.52,
                "min": 73.85,
                "max": 99.66,
                "night": 78.91,
                "eve": 84.16,
                "morn": 76.39
            },
            "feels_like": {
                "day": 94.15,
                "night": 78.91,
                "eve": 81.77,
                "morn": 74.89
            },
            "pressure": 1009,
            "humidity": 9,
            "dew_point": 30.29,
            "wind_speed": 17.74,
            "wind_deg": 9,
            "wind_gust": 22.93,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "clouds": 13,
            "pop": 0.12,
            "uvi": 10.46
        },
        {
            "dt": 1623956400,
            "sunrise": 1623929495,
            "sunset": 1623983420,
            "moonrise": 1623954420,
            "moonset": 1623913620,
            "moon_phase": 0.25,
            "temp": {
                "day": 97.95,
                "min": 72.41,
                "max": 97.95,
                "night": 79.72,
                "eve": 85.68,
                "morn": 72.84
            },
            "feels_like": {
                "day": 92.75,
                "night": 79.72,
                "eve": 83.01,
                "morn": 71.33
            },
            "pressure": 1007,
            "humidity": 9,
            "dew_point": 30.58,
            "wind_speed": 21.25,
            "wind_deg": 153,
            "wind_gust": 20.4,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 100,
            "pop": 0.29,
            "uvi": 11.07
        },
        {
            "dt": 1624042800,
            "sunrise": 1624015901,
            "sunset": 1624069838,
            "moonrise": 1624044900,
            "moonset": 1624001640,
            "moon_phase": 0.27,
            "temp": {
                "day": 79.14,
                "min": 65.05,
                "max": 85.44,
                "night": 65.05,
                "eve": 80.19,
                "morn": 68.97
            },
            "feels_like": {
                "day": 79.14,
                "night": 64.63,
                "eve": 79.9,
                "morn": 67.73
            },
            "pressure": 1014,
            "humidity": 34,
            "dew_point": 48.52,
            "wind_speed": 17,
            "wind_deg": 152,
            "wind_gust": 28.25,
            "weather": [
                {
                    "id": 501,
                    "main": "Rain",
                    "description": "moderate rain",
                    "icon": "10d"
                }
            ],
            "clouds": 71,
            "pop": 1,
            "rain": 4,
            "uvi": 11.55
        },
        {
            "dt": 1624129200,
            "sunrise": 1624102310,
            "sunset": 1624156254,
            "moonrise": 1624135500,
            "moonset": 1624089600,
            "moon_phase": 0.31,
            "temp": {
                "day": 83.86,
                "min": 63.57,
                "max": 89.82,
                "night": 71.55,
                "eve": 80.44,
                "morn": 63.57
            },
            "feels_like": {
                "day": 81.9,
                "night": 70.84,
                "eve": 80.06,
                "morn": 63.1
            },
            "pressure": 1008,
            "humidity": 30,
            "dew_point": 49.08,
            "wind_speed": 21.07,
            "wind_deg": 214,
            "wind_gust": 33.69,
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": 11,
            "pop": 1,
            "rain": 2.02,
            "uvi": 12
        },
        {
            "dt": 1624215600,
            "sunrise": 1624188720,
            "sunset": 1624242668,
            "moonrise": 1624226340,
            "moonset": 1624177680,
            "moon_phase": 0.34,
            "temp": {
                "day": 92.43,
                "min": 67.19,
                "max": 92.43,
                "night": 72.63,
                "eve": 80.83,
                "morn": 67.19
            },
            "feels_like": {
                "day": 88.11,
                "night": 71.98,
                "eve": 79.84,
                "morn": 65.77
            },
            "pressure": 1003,
            "humidity": 14,
            "dew_point": 36.46,
            "wind_speed": 19.24,
            "wind_deg": 177,
            "wind_gust": 21.61,
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": 61,
            "pop": 0.64,
            "rain": 1.14,
            "uvi": 12
        },
        {
            "dt": 1624302000,
            "sunrise": 1624275132,
            "sunset": 1624329081,
            "moonrise": 1624317300,
            "moonset": 1624265940,
            "moon_phase": 0.38,
            "temp": {
                "day": 74.48,
                "min": 66.7,
                "max": 79.27,
                "night": 70.09,
                "eve": 77.81,
                "morn": 67.96
            },
            "feels_like": {
                "day": 73.33,
                "night": 68.92,
                "eve": 76.84,
                "morn": 66.06
            },
            "pressure": 1010,
            "humidity": 36,
            "dew_point": 45.7,
            "wind_speed": 13.27,
            "wind_deg": 83,
            "wind_gust": 17.4,
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": 2,
            "pop": 0.64,
            "rain": 0.11,
            "uvi": 12
        }
    ]
}
end

def location_data
  {
   street: "",
   adminArea6: "",
   adminArea6Type: "Neighborhood",
   adminArea5: "Denver",
   adminArea5Type: "City",
   adminArea4: "Denver County",
   adminArea4Type: "County",
   adminArea3: "CO",
   adminArea3Type: "State",
   adminArea1: "US",
   adminArea1Type: "Country",
   postalCode: "",
   geocodeQualityCode: "A5XAX",
   geocodeQuality: "CITY",
   dragPoint: false,
   sideOfStreet: "N",
   linkId: "282041090",
   unknownInput: "",
   type: "s",
   latLng: {lat: 39.738453, lng: -104.984853},
   displayLatLng: {lat: 39.738453, lng: -104.984853},
   mapUrl: "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&type=map&size=225,160&locations=39.738453,-104.984853|marker-sm-50318A-1&scalebar=true&zoom=12&rand=-753459015"
  }
end

def photo_info
  {
    "total": 4783,
    "total_pages": 4783,
    "results": [
        {
            "id": "A4RpHR83luM",
            "created_at": "2021-05-01T04:12:54-04:00",
            "updated_at": "2021-06-14T03:22:54-04:00",
            "promoted_at": nil,
            "width": 5954,
            "height": 3969,
            "color": "#0c2626",
            "blur_hash": "L867}^NGNIxY0gxaxENb==RkWXs,",
            "description": "Night Time Downtown Denver",
            "alt_description": "city skyline during night time",
            "urls": {
                "raw": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?ixid=MnwyMzkwODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MjM3MDYyMzQ&ixlib=rb-1.2.1",
                "full": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyMzkwODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MjM3MDYyMzQ&ixlib=rb-1.2.1&q=85",
                "regular": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzkwODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MjM3MDYyMzQ&ixlib=rb-1.2.1&q=80&w=1080",
                "small": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzkwODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MjM3MDYyMzQ&ixlib=rb-1.2.1&q=80&w=400",
                "thumb": "https://images.unsplash.com/photo-1619856699906-09e1f58c98b1?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyMzkwODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MjM3MDYyMzQ&ixlib=rb-1.2.1&q=80&w=200"
            },
            "links": {
                "self": "https://api.unsplash.com/photos/A4RpHR83luM",
                "html": "https://unsplash.com/photos/A4RpHR83luM",
                "download": "https://unsplash.com/photos/A4RpHR83luM/download",
                "download_location": "https://api.unsplash.com/photos/A4RpHR83luM/download?ixid=MnwyMzkwODZ8MHwxfHNlYXJjaHwxfHxkZW52ZXIlMkMlMjBjb3xlbnwwfHx8fDE2MjM3MDYyMzQ"
            },
            "categories": [],
            "likes": 2,
            "liked_by_user": false,
            "current_user_collections": [],
            "sponsorship": nil,
            "user": {
                "id": "t2RB-3lbgSk",
                "updated_at": "2021-06-14T04:51:20-04:00",
                "username": "rdehamer",
                "name": "Ryan De Hamer",
                "first_name": "Ryan",
                "last_name": "De Hamer",
                "twitter_username": nil,
                "portfolio_url": "http://www.dehamermedia.com",
                "bio": "Midwest -> Anywhere\r\nMy images are collected all around the country working with brands, athletes and fitness influencers",
                "location": nil,
                "links": {
                    "self": "https://api.unsplash.com/users/rdehamer",
                    "html": "https://unsplash.com/@rdehamer",
                    "photos": "https://api.unsplash.com/users/rdehamer/photos",
                    "likes": "https://api.unsplash.com/users/rdehamer/likes",
                    "portfolio": "https://api.unsplash.com/users/rdehamer/portfolio",
                    "following": "https://api.unsplash.com/users/rdehamer/following",
                    "followers": "https://api.unsplash.com/users/rdehamer/followers"
                },
                "profile_image": {
                    "small": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                    "medium": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                    "large": "https://images.unsplash.com/profile-1577912636161-6a3ada136470image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                },
                "instagram_username": "Ryan_dehamer",
                "total_collections": 6,
                "total_likes": 0,
                "total_photos": 69,
                "accepted_tos": true,
                "for_hire": false
            },
            "tags": [
                {
                    "type": "landing_page",
                    "title": "city",
                    "source": {
                        "ancestry": {
                            "type": {
                                "slug": "wallpapers",
                                "pretty_slug": "HD Wallpapers"
                            },
                            "category": {
                                "slug": "travel",
                                "pretty_slug": "Travel"
                            },
                            "subcategory": {
                                "slug": "city",
                                "pretty_slug": "City"
                            }
                        },
                        "title": "HD City Wallpapers",
                        "subtitle": "Download Free City Wallpapers",
                        "description": "Choose from a curated selection of city wallpapers for your mobile and desktop screens. Always free on Unsplash.",
                        "meta_title": "City Wallpapers: Free HD Download [500+ HQ] | Unsplash",
                        "meta_description": "Choose from hundreds of free city wallpapers. Download HD wallpapers for free on Unsplash.",
                        "cover_photo": {
                            "id": "Nyvq2juw4_o",
                            "created_at": "2016-10-31T20:26:28-04:00",
                            "updated_at": "2021-06-10T11:32:44-04:00",
                            "promoted_at": "2016-10-31T20:26:28-04:00",
                            "width": 3465,
                            "height": 2131,
                            "color": "#0c2640",
                            "blur_hash": "LhEMa,W=WVWW_4kBjtW=?bkBaefR",
                            "description": "City architecture and skyscrapers near waterfront",
                            "alt_description": "white and brown city buildings during daytime",
                            "urls": {
                                "raw": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1",
                                "full": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&q=85&fm=jpg&crop=entropy&cs=srgb",
                                "regular": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max",
                                "small": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=400&fit=max",
                                "thumb": "https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max"
                            },
                            "links": {
                                "self": "https://api.unsplash.com/photos/Nyvq2juw4_o",
                                "html": "https://unsplash.com/photos/Nyvq2juw4_o",
                                "download": "https://unsplash.com/photos/Nyvq2juw4_o/download",
                                "download_location": "https://api.unsplash.com/photos/Nyvq2juw4_o/download"
                            },
                            "categories": [],
                            "likes": 2350,
                            "liked_by_user": false,
                            "current_user_collections": [],
                            "sponsorship": nil,
                            "user": {
                                "id": "1--L3vNK0TA",
                                "updated_at": "2021-06-10T22:45:08-04:00",
                                "username": "peterlaster",
                                "name": "Pedro Lastra",
                                "first_name": "Pedro",
                                "last_name": "Lastra",
                                "twitter_username": nil,
                                "portfolio_url": "https://www.flickr.com/photos/lastingimages/",
                                "bio": nil,
                                "location": nil,
                                "links": {
                                    "self": "https://api.unsplash.com/users/peterlaster",
                                    "html": "https://unsplash.com/@peterlaster",
                                    "photos": "https://api.unsplash.com/users/peterlaster/photos",
                                    "likes": "https://api.unsplash.com/users/peterlaster/likes",
                                    "portfolio": "https://api.unsplash.com/users/peterlaster/portfolio",
                                    "following": "https://api.unsplash.com/users/peterlaster/following",
                                    "followers": "https://api.unsplash.com/users/peterlaster/followers"
                                },
                                "profile_image": {
                                    "small": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                                    "medium": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                                    "large": "https://images.unsplash.com/placeholder-avatars/extra-large.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"
                                },
                                "instagram_username": nil,
                                "total_collections": 10,
                                "total_likes": 46,
                                "total_photos": 86,
                                "accepted_tos": false,
                                "for_hire": false
                            }
                        }
                    }
                },
                {
                    "type": "search",
                    "title": "building"
                },
                {
                    "type": "search",
                    "title": "urban"
                }
            ]
        }
    ]
}
end

def bad_location_data
  {
    "route": {
        "routeError": {
            "errorCode": 2,
            "message": ""
        }
    },
    "info": {
        "statuscode": 402,
        "copyright": {
            "imageAltText": "© 2021 MapQuest, Inc.",
            "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
            "text": "© 2021 MapQuest, Inc."
        },
        "messages": [
            "We are unable to route with the given locations."
        ]
    }
}
end

def good_location_data
  {
    "route": {
        "hasTollRoad": true,
        "hasBridge": true,
        "boundingBox": {
            "lr": {
                "lng": -97.742714,
                "lat": 30.264076
            },
            "ul": {
                "lng": -104.98761,
                "lat": 39.738453
            }
        },
        "distance": 935.3182,
        "hasTimedRestriction": false,
        "hasTunnel": false,
        "hasHighway": true,
        "computedWaypoints": [],
        "routeError": {
            "errorCode": -400,
            "message": ""
        },
        "formattedTime": "14:13:50",
        "sessionId": "60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
        "hasAccessRestriction": false,
        "realTime": 53405,
        "hasSeasonalClosure": false,
        "hasCountryCross": false,
        "fuelUsed": 46.45,
        "legs": [
            {
                "hasTollRoad": true,
                "hasBridge": true,
                "destNarrative": "Proceed to AUSTIN, TX.",
                "distance": 935.3182,
                "hasTimedRestriction": false,
                "hasTunnel": false,
                "hasHighway": true,
                "index": 0,
                "formattedTime": "14:13:50",
                "origIndex": 2,
                "hasAccessRestriction": false,
                "hasSeasonalClosure": false,
                "hasCountryCross": false,
                "roadGradeStrategy": [
                    []
                ],
                "destIndex": 23,
                "time": 51230,
                "hasUnpaved": false,
                "origNarrative": "Go south on N Broadway.",
                "maneuvers": [
                    {
                        "distance": 0.109,
                        "streets": [
                            "N Sherman St"
                        ],
                        "narrative": "Start out going south on N Sherman St toward E 13th Ave.",
                        "turnType": 0,
                        "startPoint": {
                            "lng": -104.984856,
                            "lat": 39.738453
                        },
                        "index": 0,
                        "formattedTime": "00:00:33",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=39.73845291137695,-104.98485565185547|marker-1||39.73687744140625,-104.9848403930664|marker-2||&center=39.7376651763916,-104.98484802246094&defaultMarker=none&zoom=13&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 33,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/icon-dirs-start_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.135,
                        "streets": [
                            "E 13th Ave"
                        ],
                        "narrative": "Turn right onto E 13th Ave.",
                        "turnType": 2,
                        "startPoint": {
                            "lng": -104.98484,
                            "lat": 39.736877
                        },
                        "index": 1,
                        "formattedTime": "00:00:22",
                        "directionName": "West",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=39.73687744140625,-104.9848403930664|marker-2||39.73686981201172,-104.98737335205078|marker-3||&center=39.736873626708984,-104.9861068725586&defaultMarker=none&zoom=13&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 22,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_right_sm.gif",
                        "direction": 7
                    },
                    {
                        "distance": 2.485,
                        "streets": [
                            "N Broadway"
                        ],
                        "narrative": "Turn left onto N Broadway.",
                        "turnType": 6,
                        "startPoint": {
                            "lng": -104.987373,
                            "lat": 39.73687
                        },
                        "index": 2,
                        "formattedTime": "00:06:00",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=39.73686981201172,-104.98737335205078|marker-3||39.70085144042969,-104.98760986328125|marker-4||&center=39.7188606262207,-104.98749160766602&defaultMarker=none&zoom=8&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 360,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_left_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.014,
                        "streets": [],
                        "narrative": "Turn left to take the I-25 S ramp toward Colo Spgs.",
                        "turnType": 13,
                        "startPoint": {
                            "lng": -104.98761,
                            "lat": 39.700851
                        },
                        "index": 3,
                        "formattedTime": "00:00:07",
                        "directionName": "Southeast",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=39.70085144042969,-104.98760986328125|marker-4||39.70073318481445,-104.98739624023438|marker-5||&center=39.70079231262207,-104.98750305175781&defaultMarker=none&zoom=15&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 7,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_ramp_sm.gif",
                        "direction": 5
                    },
                    {
                        "distance": 215.643,
                        "streets": [
                            "I-25 S"
                        ],
                        "narrative": "Merge onto I-25 S (Crossing into New Mexico).",
                        "turnType": 10,
                        "startPoint": {
                            "lng": -104.987396,
                            "lat": 39.700733
                        },
                        "index": 4,
                        "formattedTime": "03:06:59",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "25",
                                "type": 1,
                                "url": "http://icons.mqcdn.com/icons/rs1.png?n=25&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=39.70073318481445,-104.98739624023438|marker-5||36.88754653930664,-104.43013000488281|marker-6||&center=38.29413986206055,-104.7087631225586&defaultMarker=none&zoom=2&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 11219,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_merge_right_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.196,
                        "streets": [],
                        "narrative": "Take the US-87 E/US-64 E exit, EXIT 451, toward Raton/Clayton.",
                        "turnType": 14,
                        "startPoint": {
                            "lng": -104.43013,
                            "lat": 36.887547
                        },
                        "index": 5,
                        "formattedTime": "00:00:31",
                        "directionName": "Southwest",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "451",
                                "type": 1001,
                                "url": "http://icons.mqcdn.com/icons/rs1001.png?n=451&d=RIGHT",
                                "direction": 0
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=36.88754653930664,-104.43013000488281|marker-6||36.88501739501953,-104.4317398071289|marker-7||&center=36.886281967163086,-104.43093490600586&defaultMarker=none&zoom=12&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 31,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_gr_exitright_sm.gif",
                        "direction": 6
                    },
                    {
                        "distance": 166.123,
                        "streets": [
                            "US-87 E"
                        ],
                        "narrative": "Turn left onto Clayton Rd/US-64 E/US-87 E. Continue to follow US-87 E (Crossing into Texas).",
                        "turnType": 6,
                        "startPoint": {
                            "lng": -104.43174,
                            "lat": 36.885017
                        },
                        "index": 6,
                        "formattedTime": "02:37:56",
                        "directionName": "East",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "87",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=87&d=EAST",
                                "direction": 8
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=36.88501739501953,-104.4317398071289|marker-7||35.865394592285156,-101.97322082519531|marker-8||&center=36.375205993652344,-103.20248031616211&defaultMarker=none&zoom=3&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 9476,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_left_sm.gif",
                        "direction": 8
                    },
                    {
                        "distance": 46.32,
                        "streets": [
                            "US-87 S",
                            "US-287 S"
                        ],
                        "narrative": "Turn right onto S Dumas Ave/Texas Plains Trail/US-87 S/US-287 S. Continue to follow US-87 S/US-287 S.",
                        "turnType": 2,
                        "startPoint": {
                            "lng": -101.973221,
                            "lat": 35.865395
                        },
                        "index": 7,
                        "formattedTime": "00:42:56",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "87",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=87&d=SOUTH",
                                "direction": 4
                            },
                            {
                                "extraText": "",
                                "text": "287",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=287&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=35.865394592285156,-101.97322082519531|marker-8||35.22861099243164,-101.8313217163086|marker-9||&center=35.5470027923584,-101.90227127075195&defaultMarker=none&zoom=4&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 2576,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_right_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 2.278,
                        "streets": [
                            "US-287 S"
                        ],
                        "narrative": "Take US-287 S toward Taylor St/I-40.",
                        "turnType": 1,
                        "startPoint": {
                            "lng": -101.831322,
                            "lat": 35.228611
                        },
                        "index": 8,
                        "formattedTime": "00:04:20",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "287",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=287&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=35.22861099243164,-101.8313217163086|marker-9||35.19633483886719,-101.83651733398438|marker-10||&center=35.212472915649414,-101.83391952514648&defaultMarker=none&zoom=8&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 260,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_slight_right_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 13.581,
                        "streets": [
                            "Texas Plains Trail",
                            "US-60 W",
                            "US-87 S"
                        ],
                        "narrative": "Stay straight to go onto Texas Plains Trail/US-60 W/US-87 S.",
                        "turnType": 0,
                        "startPoint": {
                            "lng": -101.836517,
                            "lat": 35.196335
                        },
                        "index": 9,
                        "formattedTime": "00:12:44",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "60",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=60&d=WEST",
                                "direction": 7
                            },
                            {
                                "extraText": "",
                                "text": "87",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=87&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=35.19633483886719,-101.83651733398438|marker-10||35.02622604370117,-101.91918182373047|marker-11||&center=35.11128044128418,-101.87784957885742&defaultMarker=none&zoom=6&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 764,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_straight_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 109.113,
                        "streets": [
                            "I-27 S"
                        ],
                        "narrative": "Stay straight to go onto Texas Plains Trail/I-27 S. Continue to follow I-27 S.",
                        "turnType": 0,
                        "startPoint": {
                            "lng": -101.919182,
                            "lat": 35.026226
                        },
                        "index": 10,
                        "formattedTime": "01:29:09",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "27",
                                "type": 1,
                                "url": "http://icons.mqcdn.com/icons/rs1.png?n=27&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=35.02622604370117,-101.91918182373047|marker-11||33.550331115722656,-101.84514617919922|marker-12||&center=34.288278579711914,-101.88216400146484&defaultMarker=none&zoom=3&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 5349,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_straight_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.379,
                        "streets": [],
                        "narrative": "Take EXIT 1B toward US-84/Post/TX-289 Loop E.",
                        "turnType": 14,
                        "startPoint": {
                            "lng": -101.845146,
                            "lat": 33.550331
                        },
                        "index": 11,
                        "formattedTime": "00:00:30",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "1B",
                                "type": 1001,
                                "url": "http://icons.mqcdn.com/icons/rs1001.png?n=1B&d=RIGHT",
                                "direction": 0
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=33.550331115722656,-101.84514617919922|marker-12||33.54484939575195,-101.84563446044922|marker-13||&center=33.547590255737305,-101.84539031982422&defaultMarker=none&zoom=11&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 30,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_gr_exitright_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.514,
                        "streets": [
                            "Interstate 27"
                        ],
                        "narrative": "Merge onto Interstate 27.",
                        "turnType": 10,
                        "startPoint": {
                            "lng": -101.845634,
                            "lat": 33.544849
                        },
                        "index": 12,
                        "formattedTime": "00:00:53",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=33.54484939575195,-101.84563446044922|marker-13||33.53740310668945,-101.84525299072266|marker-14||&center=33.5411262512207,-101.84544372558594&defaultMarker=none&zoom=10&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 53,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_merge_right_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 112.883,
                        "streets": [
                            "US-84 E"
                        ],
                        "narrative": "Merge onto US-84 E via the ramp on the left.",
                        "turnType": 11,
                        "startPoint": {
                            "lng": -101.845253,
                            "lat": 33.537403
                        },
                        "index": 13,
                        "formattedTime": "01:41:21",
                        "directionName": "East",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "84",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=84&d=EAST",
                                "direction": 8
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=33.53740310668945,-101.84525299072266|marker-14||32.44599914550781,-100.50961303710938|marker-15||&center=32.99170112609863,-101.17743301391602&defaultMarker=none&zoom=3&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 6081,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_merge_left_sm.gif",
                        "direction": 8
                    },
                    {
                        "distance": 40.567,
                        "streets": [
                            "I-20 E",
                            "US-84 E"
                        ],
                        "narrative": "Merge onto I-20 E/US-84 E toward Abilene.",
                        "turnType": 10,
                        "startPoint": {
                            "lng": -100.509613,
                            "lat": 32.445999
                        },
                        "index": 14,
                        "formattedTime": "00:33:20",
                        "directionName": "East",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "20",
                                "type": 1,
                                "url": "http://icons.mqcdn.com/icons/rs1.png?n=20&d=EAST",
                                "direction": 8
                            },
                            {
                                "extraText": "",
                                "text": "84",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=84&d=EAST",
                                "direction": 8
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=32.44599914550781,-100.50961303710938|marker-15||32.45948791503906,-99.8501205444336|marker-16||&center=32.45274353027344,-100.17986679077148&defaultMarker=none&zoom=5&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 2000,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_merge_right_sm.gif",
                        "direction": 8
                    },
                    {
                        "distance": 3.735,
                        "streets": [
                            "W US Highway 80",
                            "I-20 Bus E",
                            "US-84 E"
                        ],
                        "narrative": "Merge onto W US Highway 80/I-20 Bus E/US-84 E via EXIT 279 toward Abilene.",
                        "turnType": 10,
                        "startPoint": {
                            "lng": -99.850121,
                            "lat": 32.459488
                        },
                        "index": 15,
                        "formattedTime": "00:03:54",
                        "directionName": "East",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "20",
                                "type": 5,
                                "url": "http://icons.mqcdn.com/icons/rs5.png?n=20&d=EAST",
                                "direction": 8
                            },
                            {
                                "extraText": "",
                                "text": "84",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=84&d=EAST",
                                "direction": 8
                            },
                            {
                                "extraText": "",
                                "text": "279",
                                "type": 1001,
                                "url": "http://icons.mqcdn.com/icons/rs1001.png?n=279&d=RIGHT",
                                "direction": 0
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=32.45948791503906,-99.8501205444336|marker-16||32.45237350463867,-99.7878189086914|marker-17||&center=32.45593070983887,-99.8189697265625&defaultMarker=none&zoom=8&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 234,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_merge_right_sm.gif",
                        "direction": 8
                    },
                    {
                        "distance": 51.617,
                        "streets": [
                            "US-84 E"
                        ],
                        "narrative": "Merge onto US-84 E toward San Angelo/Ballinger/Coleman.",
                        "turnType": 10,
                        "startPoint": {
                            "lng": -99.787819,
                            "lat": 32.452374
                        },
                        "index": 16,
                        "formattedTime": "00:46:26",
                        "directionName": "East",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "84",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=84&d=EAST",
                                "direction": 8
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=32.45237350463867,-99.7878189086914|marker-17||31.844968795776367,-99.42718505859375|marker-18||&center=32.14867115020752,-99.60750198364258&defaultMarker=none&zoom=4&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 2786,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_merge_right_sm.gif",
                        "direction": 8
                    },
                    {
                        "distance": 32.882,
                        "streets": [
                            "US-84 E"
                        ],
                        "narrative": "Turn left onto Highway 84 Byp/US-84 E/US-283 S. Continue to follow US-84 E.",
                        "turnType": 6,
                        "startPoint": {
                            "lng": -99.427185,
                            "lat": 31.844969
                        },
                        "index": 17,
                        "formattedTime": "00:34:28",
                        "directionName": "East",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "84",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=84&d=EAST",
                                "direction": 8
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=31.844968795776367,-99.42718505859375|marker-18||31.742290496826172,-98.94580841064453|marker-19||&center=31.79362964630127,-99.18649673461914&defaultMarker=none&zoom=6&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 2068,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_left_sm.gif",
                        "direction": 8
                    },
                    {
                        "distance": 30.278,
                        "streets": [
                            "US-84 E",
                            "US-183 S"
                        ],
                        "narrative": "Turn right onto Garmon Dr/US-84 E/US-183 S. Continue to follow US-84 E/US-183 S.",
                        "turnType": 2,
                        "startPoint": {
                            "lng": -98.945808,
                            "lat": 31.74229
                        },
                        "index": 18,
                        "formattedTime": "00:28:10",
                        "directionName": "East",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "84",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=84&d=EAST",
                                "direction": 8
                            },
                            {
                                "extraText": "",
                                "text": "183",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=183&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=31.742290496826172,-98.94580841064453|marker-19||31.469581604003906,-98.56817626953125|marker-20||&center=31.60593605041504,-98.75699234008789&defaultMarker=none&zoom=5&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 1690,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_right_sm.gif",
                        "direction": 8
                    },
                    {
                        "distance": 79.038,
                        "streets": [
                            "US-183 S"
                        ],
                        "narrative": "Turn right onto Fisher St/US-183 S/TX-16. Continue to follow US-183 S.",
                        "turnType": 2,
                        "startPoint": {
                            "lng": -98.568176,
                            "lat": 31.469582
                        },
                        "index": 19,
                        "formattedTime": "01:15:31",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "183",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=183&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=31.469581604003906,-98.56817626953125|marker-20||30.605304718017578,-97.86073303222656|marker-21||&center=31.037443161010742,-98.2144546508789&defaultMarker=none&zoom=4&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 4531,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_right_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 10.29,
                        "streets": [
                            "TX-183A"
                        ],
                        "narrative": "US-183 S becomes TX-183A (Portions toll).",
                        "turnType": 0,
                        "startPoint": {
                            "lng": -97.860733,
                            "lat": 30.605305
                        },
                        "index": 20,
                        "formattedTime": "00:09:28",
                        "directionName": "Southeast",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=30.605304718017578,-97.86073303222656|marker-21||30.47321128845215,-97.799072265625|marker-22||&center=30.539258003234863,-97.82990264892578&defaultMarker=none&zoom=6&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1153,
                        "time": 568,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_straight_sm.gif",
                        "direction": 5
                    },
                    {
                        "distance": 7.624,
                        "streets": [
                            "US-183 S"
                        ],
                        "narrative": "TX-183A becomes US-183 S.",
                        "turnType": 0,
                        "startPoint": {
                            "lng": -97.799072,
                            "lat": 30.473211
                        },
                        "index": 21,
                        "formattedTime": "00:07:11",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "183",
                                "type": 2,
                                "url": "http://icons.mqcdn.com/icons/rs2.png?n=183&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=30.47321128845215,-97.799072265625|marker-22||30.384410858154297,-97.74271392822266|marker-23||&center=30.428811073303223,-97.77089309692383&defaultMarker=none&zoom=7&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 431,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_straight_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 7.499,
                        "streets": [
                            "Mopac Expy",
                            "TX-1 Loop S"
                        ],
                        "narrative": "Merge onto Mopac Expy/TX-1 Loop S toward Mopac Blvd S.",
                        "turnType": 10,
                        "startPoint": {
                            "lng": -97.742714,
                            "lat": 30.384411
                        },
                        "index": 22,
                        "formattedTime": "00:07:26",
                        "directionName": "South",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [
                            {
                                "extraText": "",
                                "text": "1",
                                "type": 3,
                                "url": "http://icons.mqcdn.com/icons/rs3.png?n=1&d=SOUTH",
                                "direction": 4
                            }
                        ],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=30.384410858154297,-97.74271392822266|marker-23||30.28097915649414,-97.7671127319336|marker-24||&center=30.33269500732422,-97.75491333007812&defaultMarker=none&zoom=6&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1152,
                        "time": 446,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_merge_right_sm.gif",
                        "direction": 4
                    },
                    {
                        "distance": 0.262,
                        "streets": [],
                        "narrative": "Take the Cesar Chavez St/5th St exit.",
                        "turnType": 14,
                        "startPoint": {
                            "lng": -97.767113,
                            "lat": 30.280979
                        },
                        "index": 23,
                        "formattedTime": "00:00:25",
                        "directionName": "Southwest",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=30.28097915649414,-97.7671127319336|marker-24||30.277616500854492,-97.7688980102539|marker-25||&center=30.279297828674316,-97.76800537109375&defaultMarker=none&zoom=11&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 25,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_gr_exitright_sm.gif",
                        "direction": 6
                    },
                    {
                        "distance": 0.189,
                        "streets": [],
                        "narrative": "Keep right to take the ramp toward TX-1 Loop N/Cesar Chavez.",
                        "turnType": 12,
                        "startPoint": {
                            "lng": -97.768898,
                            "lat": 30.277617
                        },
                        "index": 24,
                        "formattedTime": "00:00:18",
                        "directionName": "Southeast",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=30.277616500854492,-97.7688980102539|marker-25||30.275304794311523,-97.76737976074219|marker-26||&center=30.276460647583008,-97.76813888549805&defaultMarker=none&zoom=12&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 18,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_ramp_sm.gif",
                        "direction": 5
                    },
                    {
                        "distance": 1.498,
                        "streets": [
                            "W Cesar Chavez St"
                        ],
                        "narrative": "Merge onto W Cesar Chavez St.",
                        "turnType": 10,
                        "startPoint": {
                            "lng": -97.76738,
                            "lat": 30.275305
                        },
                        "index": 25,
                        "formattedTime": "00:02:44",
                        "directionName": "Southeast",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=30.275304794311523,-97.76737976074219|marker-26||30.264076232910156,-97.7469711303711|marker-27||&center=30.26969051361084,-97.75717544555664&defaultMarker=none&zoom=10&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 1024,
                        "time": 164,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_merge_right_sm.gif",
                        "direction": 5
                    },
                    {
                        "distance": 0.066,
                        "streets": [
                            "Lavaca St"
                        ],
                        "narrative": "Turn left onto Lavaca St.",
                        "turnType": 6,
                        "startPoint": {
                            "lng": -97.746971,
                            "lat": 30.264076
                        },
                        "index": 26,
                        "formattedTime": "00:00:08",
                        "directionName": "North",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "mapUrl": "http://www.mapquestapi.com/staticmap/v5/map?key=ceCZyfUggml8ox0UDRw1FZ4SMuyalcpJ&size=225,160&locations=30.264076232910156,-97.7469711303711|marker-27||30.264978408813477,-97.74659729003906|marker-28||&center=30.264527320861816,-97.74678421020508&defaultMarker=none&zoom=14&rand=1620771742&session=60c93acd-00fd-6750-02b4-32bc-0e40d8a8f57d",
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 8,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/rs_left_sm.gif",
                        "direction": 1
                    },
                    {
                        "distance": 0,
                        "streets": [],
                        "narrative": "Welcome to AUSTIN, TX.",
                        "turnType": -1,
                        "startPoint": {
                            "lng": -97.746597,
                            "lat": 30.264978
                        },
                        "index": 27,
                        "formattedTime": "00:00:00",
                        "directionName": "",
                        "maneuverNotes": [],
                        "linkIds": [],
                        "signs": [],
                        "transportMode": "AUTO",
                        "attributes": 0,
                        "time": 0,
                        "iconUrl": "http://content.mqcdn.com/mqsite/turnsigns/icon-dirs-end_sm.gif",
                        "direction": 0
                    }
                ],
                "hasFerry": false
            }
        ],
        "options": {
            "arteryWeights": [],
            "cyclingRoadFactor": 1,
            "timeType": 0,
            "useTraffic": false,
            "returnLinkDirections": false,
            "countryBoundaryDisplay": true,
            "enhancedNarrative": false,
            "locale": "en_US",
            "tryAvoidLinkIds": [],
            "drivingStyle": 2,
            "doReverseGeocode": true,
            "generalize": -1,
            "mustAvoidLinkIds": [],
            "sideOfStreetDisplay": true,
            "routeType": "FASTEST",
            "avoidTimedConditions": false,
            "routeNumber": 0,
            "shapeFormat": "raw",
            "maxWalkingDistance": -1,
            "destinationManeuverDisplay": true,
            "transferPenalty": -1,
            "narrativeType": "text",
            "walkingSpeed": -1,
            "urbanAvoidFactor": -1,
            "stateBoundaryDisplay": true,
            "unit": "M",
            "highwayEfficiency": 22,
            "maxLinkId": 0,
            "maneuverPenalty": -1,
            "avoidTripIds": [],
            "filterZoneFactor": -1,
            "manmaps": "true"
        },
        "locations": [
            {
                "dragPoint": false,
                "displayLatLng": {
                    "lng": -104.984856,
                    "lat": 39.738453
                },
                "adminArea4": "Denver County",
                "adminArea5": "Denver",
                "postalCode": "",
                "adminArea1": "US",
                "adminArea3": "CO",
                "type": "s",
                "sideOfStreet": "N",
                "geocodeQualityCode": "A5XAX",
                "adminArea4Type": "County",
                "linkId": 40287819,
                "street": "",
                "adminArea5Type": "City",
                "geocodeQuality": "CITY",
                "adminArea1Type": "Country",
                "adminArea3Type": "State",
                "latLng": {
                    "lng": -104.984853,
                    "lat": 39.738453
                }
            },
            {
                "dragPoint": false,
                "displayLatLng": {
                    "lng": -97.746597,
                    "lat": 30.264978
                },
                "adminArea4": "Travis County",
                "adminArea5": "Austin",
                "postalCode": "",
                "adminArea1": "US",
                "adminArea3": "TX",
                "type": "s",
                "sideOfStreet": "N",
                "geocodeQualityCode": "A5XAX",
                "adminArea4Type": "County",
                "linkId": 28492614,
                "street": "",
                "adminArea5Type": "City",
                "geocodeQuality": "CITY",
                "adminArea1Type": "Country",
                "adminArea3Type": "State",
                "latLng": {
                    "lng": -97.746598,
                    "lat": 30.264979
                }
            }
        ],
        "time": 51230,
        "hasUnpaved": false,
        "locationSequence": [
            0,
            1
        ],
        "hasFerry": false
    },
    "info": {
        "statuscode": 0,
        "copyright": {
            "imageAltText": "© 2021 MapQuest, Inc.",
            "imageUrl": "http://api.mqcdn.com/res/mqlogo.gif",
            "text": "© 2021 MapQuest, Inc."
        },
        "messages": []
    }
}
end
