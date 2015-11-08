require_relative '../lib/linkedin-analytics.rb'

# Record and playback LinkedIn API calls
require 'vcr'
VCR.configure do |config|
  config.cassette_library_dir = "./vcr_cassettes"
  config.hook_into :webmock
end

require 'webmock/rspec'

# # https://coveralls.io/r/emorikawa/linkedin-oauth2
# require 'coveralls'
# Coveralls.wear!