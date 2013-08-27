
# Restart server to reflect any changes


Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
  { approval_prompt: 'force' }
end

# TODO: Create anti-request forgery token for google plus signin: https://developers.google.com/+/web/signin/server-side-flow
