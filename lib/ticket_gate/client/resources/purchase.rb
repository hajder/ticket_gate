module TicketGate
  class Client < RocketPants::Client
    class Purchase < APISmith::Smash
      property :created_at
      property :id
      property :person_id
      property :updated_at
    end

    def list_purchases
      get "purchases", :transformer => Purchase
    end

    def get_purchase id
      get "purchases/#{id}", :transformer => Purchase
    end
  end
end