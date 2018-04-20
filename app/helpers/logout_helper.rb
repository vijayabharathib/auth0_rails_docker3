module LogoutHelper
    def logout_url
        domain = 'tugboat.auth0.com'
        request_params = {
            returnTo: root_url,
            client_id: 'u1kYusNsyW397MxD2z5oF6rWU4Jdrc4q'
        }

        URI::HTTPS.build(host: domain, path: '/v2/logout', query: to_query(request_params))
    end

    private

    def to_query(hash)
        hash.map { |k, v| "#{k}=#{URI.escape(v)}" unless v.nil? }.reject(&:nil?).join('&')
    end
end
