module TicketGate
  class Client < RocketPants::Client
    # ---- Setup -----------------------------------
    # ----------------------------------------------
    version 1
    if Rails.env.development?
      base_uri 'http://ticketing.dev'
    else
      base_uri 'https://api.stagelink.com'
    end

    def initialize access_token = nil
      raise 'Please initialize with your api access token' unless access_token
      @access_token = access_token
    end

    def base_request_options
      { :headers => { 'Authorization' => ActionController::HttpAuthentication::Token.encode_credentials(@access_token) } }
    end
  end
end
