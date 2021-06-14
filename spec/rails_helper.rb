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
