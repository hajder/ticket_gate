module TicketGate
  class Client < RocketPants::Client
    class Event < APISmith::Smash
      property :created_at
      property :currency
      property :end_at
      property :id
      property :name
      property :parent_id
      property :start_at
      property :ticket_limit
      property :updated_at
    end

    def list_events
      get "events", :transformer => Event
    end

    def get_event id
      get "events/#{id}", :transformer => Event
    end

    def create_event params
      post "events", :extra_body => { :event => params }, :transformer => Event
    end

    def update_event id, params
      put "events/#{id}", :extra_body => { :event => params }, :transformer => Event
    end

    def destroy_event id
      delete "events/#{id}", :transformer => Event
    end
  end
end
