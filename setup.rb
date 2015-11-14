require 'rubygems'
require_relative './lib/linkedin-analytics.rb'
require './config'

class LiData
	#testing linkedin analytics
	attr_accessor :url

	def initialize
		@oauth = LinkedInAnalytics::OAuth2.new
		@url = @oauth.auth_code_url(:scope => "r_basicprofile rw_company_admin r_emailaddress w_share")
	end

	def get_access(code)
		@access_token = @oauth.get_access_token(code)
	end

	def company_admin(token, company)
		@company = LinkedInAnalytics::APIResource.new(token)
		@company.sharing_enabled(company)
	end
end



# # get your api keys at https://www.linkedin.com/secure/developer



# # If you want to use one of the scopes from linkedin you have to pass it in at this point
# # You can learn more about it here: http://developer.linkedin.com/documents/authentication
# @request_token = @client.request_token({}, :scope => "r_basicprofile rw_company_admin r_emailaddress")
# @rtoken = @request_token.token
# @rsecret = @request_token.secret



# to test from your desktop, open the following url in your browser
# and record the pin it gives you
# request_token.authorize_url
# # => "https://api.linkedin.com/uas/oauth/authorize?oauth_token=<generated_token>"

# # # then fetch your access keys
# @client.authorize_from_request(rtoken, rsecret, pin)
# # # => ["OU812", "8675309"] # <= save these for future requests

# # or authorize from previously fetched access keys
# client.authorize_from_access("OU812", "8675309")

# you're now free to move about the cabin, call any API method