#Rails.application.config.session_store :cache_store
if Rails.env.development?
    Rails.application.config.session_store :cookie_store, key: '_app_session', domain: :all 
end