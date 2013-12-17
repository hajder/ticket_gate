module TicketGate
  class Client < RocketPants::Client
    class Webhook < APISmith::Smash
      property :created_at
      property :id
      property :updated_at
      property :url
    end

    def list_webhooks
      get "webhooks", :transformer => Webhook
    end

    def get_webhook id
      get "webhooks/#{id}", :transformer => Webhook
    end

    def create_webhook params
      post "webhooks", :extra_body => { :webhook => params }, :transformer => Webhook
    end

    def update_webhook id, params
      put "webhooks/#{id}", :extra_body => { :webhook => params }, :transformer => Webhook
    end

    def destroy_webhook id
      delete "webhooks/#{id}", :transformer => Webhook
    end
  end
end
