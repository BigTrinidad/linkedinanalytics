require 'oauth2'
require_relative 'linkedin_analytics/configuration.rb'
require_relative 'linkedin_analytics/oauth2.rb'
require_relative 'linkedin_analytics/access_token.rb'
require_relative 'linkedin_analytics/errors.rb'

module LinkedInAnalytics
  @config = Configuration.new

  class << self
    attr_accessor :config
  end

  def self.configure
    yield self.config
  end
end