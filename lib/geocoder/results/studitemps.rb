require 'geocoder/results/base'

module Geocoder::Result
  class Studitemps < Base
    ##
    # Geolocation
    def coordinates
      [@data['latitude'].to_f, @data['longitude'].to_f]
    end
  end
end
