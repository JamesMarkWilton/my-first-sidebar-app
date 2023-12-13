Rails.application.config.middleware.use OmniAuth::Builder do
    provider :procore, ENV['PROCORE_KEY'], ENV['PROCORE_SECRET'], 
    client_options: {
        site: ENV['OAUTH_URL'],
        api_site: ENV['BASE_URL'],
      }
  end

OmniAuth.config.allowed_request_methods = [:post, :get]
OmniAuth.config.silence_get_warning = true