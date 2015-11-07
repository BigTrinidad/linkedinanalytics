require "linked_in/configuration"

module LinkedIn
  @config = Configuration.new

  class << self
    attr_accessor :config
  end

  def self.configure
    yield self.config
  end
end