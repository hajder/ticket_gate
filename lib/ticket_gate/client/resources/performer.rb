module TicketGate
  class Client < RocketPants::Client
    class Performer < APISmith::Smash
      property :created_at
      property :description
      property :id
      property :name
      property :updated_at
    end

    def list_performers
      get "performers", :transformer => Performer
    end

    def get_performer id
      get "performers/#{id}", :transformer => Performer
    end

    def create_performer params
      post "performers", :extra_body => { :performer => params }, :transformer => Performer
    end

    def update_performer id, params
      put "performers/#{id}", :extra_body => { :performer => params }, :transformer => Performer
    end

    def destroy_performer id
      delete "performers/#{id}", :transformer => Performer
    end
  end
end