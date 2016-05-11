Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1062592240482034', 'e06911b9ce9d644ac70526f77b04ebdd'
end
# heroku config:set FACEBOOK_KEY=0123456789
# heroku config:set FACEBOOK_SECRET=0123456789