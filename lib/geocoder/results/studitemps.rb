require 'geocoder/results/base'

module Geocoder::Result
  class Studitemps < Base
    ##
    # Geolocation
    def coordinates
      [@data['lat'].to_f, @data['lon'].to_f]
    end
  end
end
