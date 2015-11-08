ENV["LINKEDIN_CLIENT_ID"] = '77xdly13q1h6wx'
ENV["LINKEDIN_CLIENT_SECRET"] = 'FPFVihjDuz81F2so'

LinkedInAnalytics.configure do |config|
  config.client_id     = ENV["LINKEDIN_CLIENT_ID"]
  config.client_secret = ENV["LINKEDIN_CLIENT_SECRET"]

  # This must exactly match the redirect URI you set on your application's
  # settings page. If your redirect_uri is dynamic, pass it into
  # `auth_code_url` instead.
  config.redirect_uri  = "http://localhost:3000/auth/linkedin/callback"
end
