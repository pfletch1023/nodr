Rails.application.config.middleware.use OmniAuth::Builder do
	if Rails.env == "production"
		provider :facebook, 'YOUR ID', 'YOUR SECRET'
	else
		provider :facebook, '343629322437383', '7e510c5b72f620481bf44d5873914161'
	end
end