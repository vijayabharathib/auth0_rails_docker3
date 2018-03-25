Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'u1kYusNsyW397MxD2z5oF6rWU4Jdrc4q',
    Rails.application.secrets.auth0_client_secret,
    'tugboat.auth0.com',
    callback_path: "/auth/oauth2/callback",
    authorize_params: {
      scope: 'openid email profile',
      audience: 'https://tugboat.auth0.com/userinfo'
    }
  )
end