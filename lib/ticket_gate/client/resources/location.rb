module TicketGate
  class Client < RocketPants::Client
    class Location < APISmith::Smash
      property :address
      property :created_at
      property :id
      property :latitude
      property :locatable_id
      property :locatable_type
      property :longitude
      property :name
      property :updated_at
    end

    def list_locations
      get "locations", :transformer => Location
    end

    def get_location id
      get "locations/#{id}", :transformer => Location
    end

    def create_location params
      post "locations", :extra_body => { :location => params }, :transformer => Location
    end

    def update_location id, params
      put "locations/#{id}", :extra_body => { :location => params }, :transformer => Location
    end

    def destroy_location id
      delete "locations/#{id}", :transformer => Location
    end
  end
end