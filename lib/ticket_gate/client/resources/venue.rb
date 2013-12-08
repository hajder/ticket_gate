module TicketGate
  class Client < RocketPants::Client
    class Venue < APISmith::Smash
      property :created_at
      property :event_id
      property :id
      property :name
      property :updated_at
    end

    def list_venues
      get "venues", :transformer => Venue
    end

    def get_venue id
      get "venues/#{id}", :transformer => Venue
    end

    def create_venue params
      post "venues", :extra_body => { :venue => params }, :transformer => Venue
    end

    def update_venue id, params
      put "venues/#{id}", :extra_body => { :venue => params }, :transformer => Venue
    end

    def destroy_venue id
      delete "venues/#{id}", :transformer => Venue
    end
  end
end