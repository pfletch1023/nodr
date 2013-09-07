if Rails.env == "production"
	ENV['fb_app_id'] = "FILL IN" 
	ENV['fb_secret'] = "FILL IN"
else
	ENV['fb_app_id'] = '572459842812961'
	ENV['fb_secret'] = '09dd5858d4e06bc66b803f87dbb6dfdc'
end

ENV['fb_permissions'] = "email" # e.g. create_event, user_groups, publish_stream

Rails.application.config.middleware.use OmniAuth::Builder do
	provider :facebook, ENV['fb_app_id'], ENV['fb_secret'], scope: ENV['fb_permissions'], client_options: { :ssl => { :ca_file => '/usr/lib/ssl/certs/ca-certificates.crt' } }
end