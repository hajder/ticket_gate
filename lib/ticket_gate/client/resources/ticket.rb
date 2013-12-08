module TicketGate
  class Client < RocketPants::Client
    class Ticket < APISmith::Smash
      property :barcode
      property :created_at
      property :id
      property :person_id
      property :punched
      property :purchase_id
      property :ticket_category_id
      property :updated_at
    end

    def list_tickets
      get "tickets", :transformer => Ticket
    end

    def get_ticket id
      get "tickets/#{id}", :transformer => Ticket
    end

    def create_ticket params
      post "tickets", :extra_body => { :ticket => params }, :transformer => Ticket
    end

    def update_ticket id, params
      put "tickets/#{id}", :extra_body => { :ticket => params }, :transformer => Ticket
    end

    def destroy_ticket id
      delete "tickets/#{id}", :transformer => Ticket
    end

    def punch_ticket barcode
      put "tickets", :extra_body => { :barcode => barcode }, :transformer => Ticket
    end
  end
end