Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['heroku config:set FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
# heroku config:set FACEBOOK_KEY=0123456789
# heroku config:set FACEBOOK_SECRET=0123456789