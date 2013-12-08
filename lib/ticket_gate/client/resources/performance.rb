module TicketGate
  class Client < RocketPants::Client
    class Performance < APISmith::Smash
      property :created_at
      property :end_at
      property :event_id
      property :id
      property :performer_id
      property :start_at
      property :updated_at
    end

    def list_performances
      get "performances", :transformer => Performance
    end

    def get_performance id
      get "performances/#{id}", :transformer => Performance
    end

    def create_performance params
      post "performances", :extra_body => { :performance => params }, :transformer => Performance
    end

    def update_performance id, params
      put "performances/#{id}", :extra_body => { :performance => params }, :transformer => Performance
    end

    def destroy_performance id
      delete "performances/#{id}", :transformer => Performance
    end
  end
end