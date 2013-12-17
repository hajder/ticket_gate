# TicketGate

Ruby client to easily communicate with Stagelink's ticketing API.

## Installation

Add this line to your application's Gemfile:

    gem 'ticket_gate'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ticket_gate

## Usage

### In a nutshell

1. Instantiate the client using your Stagelink API key:

        require "ticket_gate"
        client = TicketGate::Client.new "my access token"
         => #<TicketGate::Client:0x007fce4c080760 @access_token="my access token">
         
   Don't have an API key yet? [Sign up for Stagelink Ticketing!](https://api.stagelink.com)

2. Create resources:

        # Create event
        event = client.create_event(
          :name => 'Me live!',
          :start_at => 1.week.from_now,
          :end_at => 2.week.from_now + 2.hours
        )
         => #<TicketGate::Client::Event created_at="2013-12-09T10:36:23Z" end_at="2013-12-23T12:36:23Z" id=4 name="Me live!" parent_id=nil start_at="2013-12-16T10:36:23Z" ticket_limit=nil updated_at="2013-12-09T10:36:23Z">

        # Create ticket category
        ticket_category = client.create_ticket_category(
          :name => 'Awesome ticket',
          :event_id => event.id,
          :price => 10,
          :currency => 'USD'
        )
         => #<TicketGate::Client::TicketCategory created_at="2013-12-09T10:40:54Z" currency="USD" description=nil event_id=4 id=2 name="Awesome ticket" price=10.0 ticket_limit=nil updated_at="2013-12-09T10:40:54Z">

    Returned resources are wrapped in `TicketGate::Client::#{resource_name}` and act like any other object in Ruby:

        event.name
         => "Me live!"

3. Sell tickets!

        <embed src="https://api.stagelink.com/events/<%= #{event.id} %>"></embed>

This will display your event and enable people to buy tickets from the categories you specified.

### Resources
The API offers the following resources with the following methods to interact:

- Event
    - `#list_events`
    - `#get_event(id)`
    - `#create_event(params = {})`
    - `#update_event(id, params = {})`
    - `#destroy_event(id)`
- Location
    - `#list_locations`
    - `#get_location(id)`
    - `#create_location(params = {})`
    - `#update_location(id, params = {})`
    - `#destroy_location(id)`
- Performance
    - `#list_performances`
    - `#get_performance(id)`
    - `#create_performance(params = {})`
    - `#update_performance(id, params = {})`
    - `#destroy_performance(id)`
- Performer
    - `#list_performers`
    - `#get_performer(id)`
    - `#create_performer(params = {})`
    - `#update_performer(id, params = {})`
    - `#destroy_performer(id)`
- Person
    - `#list_people`
    - `#get_person(id)`
    - `#create_person(params = {})`
    - `#update_person(id, params = {})`
    - `#destroy_person(id)`
- Purchase
    - `#list_purchases`
    - `#get_purchase(id)`
- Ticket
    - `#list_tickets`
    - `#get_ticket(id)`
    - `#update_ticket(id, params = {})`
    - `#destroy_ticket(id)`
    - `#punch_ticket(barcode)`
- TicketCategory
    - `#list_ticket_categories`
    - `#get_ticket_category(id)`
    - `#create_ticket_category(params = {})`
    - `#update_ticket_category(id, params = {})`
    - `#destroy_ticket_category(id)`
- Venue
    - `#list_venues`
    - `#get_venue(id)`
    - `#create_venue(params = {})`
    - `#update_venue(id, params = {})`
    - `#destroy_venue(id)`
- Webhook
    - `#list_webhooks`
    - `#get_webhook(id)`
    - `#create_webhook(params = {})`
    - `#update_webhook(id, params = {})`
    - `#destroy_webhook(id)`
    
The list actions return a paginated array of resources, all other actions will return a single resource. In addition, tickets can be punched; purchases can only be read (as collection and single resource), not manipulated.

For more information on how the Stagelink Ticketing API works, check out [https://api.stagelink.com/docs](https://api.stagelink.com/docs).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
