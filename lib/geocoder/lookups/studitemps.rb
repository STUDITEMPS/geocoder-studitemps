require 'geocoder/lookups/base'
require 'geocoder/results/studitemps'

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
  end
end
