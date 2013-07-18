Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '343629322437383', '7e510c5b72f620481bf44d5873914161'
end