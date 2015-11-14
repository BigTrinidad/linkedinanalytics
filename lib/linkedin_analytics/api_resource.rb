require 'httparty'
module LinkedInAnalytics
	class APIResource 
		# Including API Resource here for now but
		# in the future might have to move it over to the configuration
		# portion of the module
		include HTTParty
		base_uri 'api.linkedin.com'

		def initialize(access_token)
			# Passing the access token to the intitialize method
			# then placing the header in the get request to the linkedin API
			@options = {query: {headers: {"Authorization" => access_token}}}
		end

		def sharing_enabled(id)
			self.class.get("#{id}/is-company-share-enabled?format=json", @options)
		end

	end
end