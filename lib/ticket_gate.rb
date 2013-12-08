require "ticket_gate/version"
require "rocket_pants"

module TicketGate
  class Client < RocketPants::Client
    # ---- Setup -----------------------------------
    # ----------------------------------------------
    version 1
    base_uri 'http://localhost:3000'

    def initialize access_token = nil
      raise 'Please initialize with your api access token' unless access_token
      @access_token = access_token
    end

    def base_request_options
      { :headers => { 'Authorization' => ActionController::HttpAuthentication::Token.encode_credentials(@access_token) } }
    end

    # ---- Events -----------------------------------
    # -----------------------------------------------
    class Event < APISmith::Smash
      property :created_at
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
      post "events", :body => { :event => params }, :transformer => Event
    end

    def update_event id, params
      put "events/#{id}", :body => { :event => params }, :transformer => Event
    end

    def destroy_event id
      delete "events/#{id}", :transformer => Event
    end

    # ---- Locations --------------------------------
    # -----------------------------------------------
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
      post "locations", :body => { :location => params }, :transformer => Location
    end

    def update_location id, params
      put "locations/#{id}", :body => { :location => params }, :transformer => Location
    end

    def destroy_location id
      delete "locations/#{id}", :transformer => Location
    end

    # ---- Performances------------------------------
    # -----------------------------------------------
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
      post "performances", :body => { :performance => params }, :transformer => Performance
    end

    def update_performance id, params
      put "performances/#{id}", :body => { :performance => params }, :transformer => Performance
    end

    def destroy_performance id
      delete "performances/#{id}", :transformer => Performance
    end

    # ---- Performers -------------------------------
    # -----------------------------------------------
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
      post "performers", :body => { :performer => params }, :transformer => Performer
    end

    def update_performer id, params
      put "performers/#{id}", :body => { :performer => params }, :transformer => Performer
    end

    def destroy_performer id
      delete "performers/#{id}", :transformer => Performer
    end

    # ---- People -----------------------------------
    # -----------------------------------------------
    class Person < APISmith::Smash
      property :age
      property :birthday
      property :company_name
      property :created_at
      property :email
      property :first_name
      property :gender
      property :id
      property :job_title
      property :last_name
      property :phone_number
      property :prefix
      property :updated_at
    end

    def list_people
      get "people", :transformer => Person
    end

    def get_person id
      get "people/#{id}", :transformer => Person
    end

    def create_person params
      post "people", :body => { :person => params }, :transformer => Person
    end

    def update_person id, params
      put "people/#{id}", :body => { :person => params }, :transformer => Person
    end

    def destroy_person id
      delete "people/#{id}", :transformer => Person
    end

    # ---- Purchases --------------------------------
    # -----------------------------------------------
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

    # ---- Tickets ----------------------------------
    # -----------------------------------------------
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
      post "tickets", :body => { :ticket => params }, :transformer => Ticket
    end

    def update_ticket id, params
      put "tickets/#{id}", :body => { :ticket => params }, :transformer => Ticket
    end

    def destroy_ticket id
      delete "tickets/#{id}", :transformer => Ticket
    end

    def punch_ticket barcode
      put "tickets", :body => { :barcode => barcode }, :transformer => Ticket
    end

    # ---- Ticket categories ------------------------
    # -----------------------------------------------
    class TicketCategory < APISmith::Smash
      property :created_at
      property :currency
      property :description
      property :event_id
      property :id
      property :name
      property :price
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
      post "ticket_categories", :body => { :ticket_category => params }, :transformer => TicketCategory
    end

    def update_ticket_category id, params
      put "ticket_categories/#{id}", :body => { :ticket_category => params }, :transformer => TicketCategory
    end

    def destroy_ticket_category id
      delete "ticket_categories/#{id}", :transformer => TicketCategory
    end

    # ---- Venues -----------------------------------
    # -----------------------------------------------
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
      post "venues", :body => { :venue => params }, :transformer => Venue
    end

    def update_venue id, params
      put "venues/#{id}", :body => { :venue => params }, :transformer => Venue
    end

    def destroy_venue id
      delete "venues/#{id}", :transformer => Venue
    end
  end
end
