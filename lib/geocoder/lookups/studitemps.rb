require 'geocoder/lookups/base'
require 'geocoder/results/studitemps'
require_relative './../../auth0'

module Geocoder::Lookup

  # This module patches  the 'studitemps' lookup method into the known geocoders array
  module AddStuditempsToStreetServices
    def street_services
      super + [:studitemps]
    end
  end
  extend AddStuditempsToStreetServices

  class Studitemps < Base
    def name
      'Studitemps'
    end

    def supported_protocols
      [:https]
    end

    def results(query)
      return [] unless doc = fetch_data(query)

      [doc]
    end

    private

    def base_query_url(query)
      text = CGI.escape(query.sanitized_text.strip)
      "#{protocol}://#{configuration[:host]}/geocode?address=#{text}"
    end

    def make_api_request(query)
      add_authorization_header
      super
    end

    def add_authorization_header
      return unless configuration[:auth0]

      configuration.http_headers["AUTHORIZATION"] ||= "Bearer #{get_auth0_token}"
    end

    def get_auth0_token
      return cache.read("auth0_token") if cache&.read("auth0_token")

      cache&.write("auth0_token", auth0_access_token.token, expires_in: auth0_access_token.expires_in - 10)
      auth0_access_token.token
    end

    def auth0_access_token
      @auth0_access_token ||= Auth0.new(**configuration.auth0.slice(:client_id, :client_secret, :site))
                                .token(audience: configuration.auth0[:audience])
    end

    def cache
      configuration[:cache_store]
    end
  end
end
