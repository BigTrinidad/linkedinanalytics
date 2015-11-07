require 'minitest/autorun'
require './setup.rb'

class TestLinkedin < Minitest::Unit::TestCase
	def setup
		@li = LiData.new
	end

	def test_authroization_url
		assert @li.auth_url.include? "linkedin.com"
	end
end