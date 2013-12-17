module TicketGate
  class Client < RocketPants::Client
    class TicketCategory < APISmith::Smash
      property :created_at
      property :description
      property :event_id
      property :id
      property :include_qr_code
      property :name
      property :price
      property :sales_end_at
      property :ticket_limit
      property :updated_at
    end

    def list_ticket_categories
      get "ticket_categories", :transformer => TicketCategory
    end

    def get_ticket_category id
      get "ticket_categories/#{id}", :transformer => TicketCategory
    end

    def create_ticket_category params
      post "ticket_categories", :extra_body => { :ticket_category => params }, :transformer => TicketCategory
    end

    def update_ticket_category id, params
      put "ticket_categories/#{id}", :extra_body => { :ticket_category => params }, :transformer => TicketCategory
    end

    def destroy_ticket_category id
      delete "ticket_categories/#{id}", :transformer => TicketCategory
    end
  end
end