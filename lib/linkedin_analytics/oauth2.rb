module LinkedInAnalytics
  # The LinkedIn::OAuth2::Client class. Inherits directly from [intreda/oauth2](https://github.com/intridea/oauth2)'s `OAuth2::Client`
  #
  # LinkedIn::OAuth2 sets the following default options:
  #
  # * site = "https://www.linkedin.com"
  # * token_url = "/uas/oauth2/accessToken"
  # * authorize_url = "/uas/oauth2/authorization"
  #
  # More details on LinkedIn's Authorization process can be found here: https://developer.linkedin.com/documents/authentication
	class OAuth2 < ::OAuth2::Client


	attr_accessor :access_token

	# Instantiate a new OAuth 2.0 client using your client ID (aka API
    # Key) and client secret (aka Secret Key).
    #
    # You should set the client_id and client_secret in the config.
    #
    #     LinkedIn.configure do |config|
    #       config.client_id     = ENV["LINKEDIN_CLIENT_ID"]
    #       config.client_secret = ENV["LINKEDIN_CLIENT_SECRET"]
    #     end
    #
    # This will let you initialize with zero arguments.
    #
    # If you have already set the `client_id` and `client_secret` in your
    # config, the first and only argument can be the `options` hash.
    #
    # @param [String] client_id the client_id value
    # @param [String] client_secret the client_secret value
    # @param [Hash] options the options to create the client with
    # @option options [Symbol] :token_method (:post) HTTP method to use to
    #   request token (:get or :post)
    # @option options [Hash] :connection_opts ({}) Hash of connection options 
    #   to pass to initialize Faraday with
    # @option options [FixNum] :max_redirects (5) maximum number of redirects 
    #   to follow
    # @option options [Boolean] :raise_errors (true) whether or not to
    #   raise an error on malformed responses
    # @yield [builder] The Faraday connection builder

    def initialize(client_id=LinkedIn.config.client_id,
               client_secret=LinkedIn.config.client_secret,
               options = {}, &block)

	      if client_id.is_a? Hash
	        options = client_id
	        client_id = LinkedIn.config.client_id
	      end

	      options = default_oauth_options(options)

	      super client_id, client_secret, options, &block

	      @redirect_uri = options[:redirect_uri]

	      if self.options[:raise_errors]
	        check_credentials!(client_id, client_secret)
	      end
	    end
	end