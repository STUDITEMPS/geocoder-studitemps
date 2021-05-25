# frozen_string_literal: true

require "oauth2"

class Auth0
  attr_reader :client

  def initialize(client_id:, client_secret:, site:)
    @client = OAuth2::Client.new(client_id, client_secret, site: site)
  end

  def token(audience:)
    @token ||= client.client_credentials.get_token(audience: audience)
  end
end
