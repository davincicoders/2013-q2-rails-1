Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,
    ENV['FACEBOOK_KEY'] || raise("Missing FACEBOOK_KEY env var"),
    ENV['FACEBOOK_SECRET'] || raise("Missing FACEBOOK_SECRET env var")
end
