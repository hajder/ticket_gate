require "spec_helper"

describe TicketGate do
  describe TicketGate::Client do
    describe 'Setup' do
      subject { TicketGate::Client }

      its(:version)  { should eq 1 }
      its(:base_uri) { should eq 'http://localhost:3000' }
      pending "set base_uri to actual production uri"

      describe '#initialize' do
        it 'needs an access token' do
          expect {
            TicketGate::Client.new
          }.to raise_exception 'Please initialize with your api access token'
        end

        it 'works' do
          tg = TicketGate::Client.new('123')
          tg.instance_variable_get(:@access_token).should eq '123'
        end
      end

      describe '#base_request_options' do
        specify { TicketGate::Client.new('123').base_request_options.should eq({ :headers => { 'Authorization' => ActionController::HttpAuthentication::Token.encode_credentials('123') } }) }
      end
    end

    describe 'Resources' do
      subject { TicketGate::Client.new('123') }

      describe 'Event' do
        describe 'Methods' do
          [ :list_events, :get_event, :create_event, :update_event, :destroy_event ].each do |method|
            it { should respond_to method }
          end
        end

        describe 'Properties' do
          subject { TicketGate::Client::Event }

          [ :created_at, :end_at, :id, :name, :parent_id, :start_at, :ticket_limit, :updated_at ].each do |property|
            its(:properties) { should include property }
          end
        end
      end

      describe 'Location' do
        describe 'Methods' do
          [ :list_locations, :get_location, :create_location, :update_location, :destroy_location ].each do |method|
            it { should respond_to method }
          end
        end

        describe 'Properties' do
          subject { TicketGate::Client::Location }

          [ :address, :created_at, :id, :latitude, :locatable_id, :locatable_type, :longitude, :name, :updated_at ].each do |property|
            its(:properties) { should include property }
          end
        end
      end

      describe 'Performance' do
        describe 'Methods' do
          [ :list_performances, :get_performance, :create_performance, :update_performance, :destroy_performance ].each do |method|
            it { should respond_to method }
          end
        end

        describe 'Properties' do
          subject { TicketGate::Client::Performance }

          [ :created_at, :end_at, :event_id, :id, :performer_id, :start_at, :updated_at ].each do |property|
            its(:properties) { should include property }
          end
        end
      end

      describe 'Performer' do
        describe 'Methods' do
          [ :list_performers, :get_performer, :create_performer, :update_performer, :destroy_performer ].each do |method|
            it { should respond_to method }
          end
        end

        describe 'Properties' do
          subject { TicketGate::Client::Performer }

          [ :created_at, :description, :id, :name, :updated_at ].each do |property|
            its(:properties) { should include property }
          end
        end
      end

      describe 'People' do
        describe 'Methods' do
          [ :list_people, :get_person, :create_person, :update_person, :destroy_person ].each do |method|
            it { should respond_to method }
          end
        end

        describe 'Properties' do
          subject { TicketGate::Client::Person }

          [ :age, :birthday, :company_name, :created_at, :email, :first_name, :gender, :id, :job_title, :last_name, :phone_number, :prefix, :updated_at ].each do |property|
            its(:properties) { should include property }
          end
        end
      end

      describe 'Purchase' do
        describe 'Methods' do
          [ :list_purchases, :get_purchase ].each do |method|
            it { should respond_to method }
          end
        end

        describe 'Properties' do
          subject { TicketGate::Client::Purchase }

          [ :created_at, :id, :person_id, :updated_at ].each do |property|
            its(:properties) { should include property }
          end
        end
      end

      describe 'Ticket' do
        describe 'Methods' do
          [ :list_tickets, :get_ticket, :create_ticket, :update_ticket, :destroy_ticket, :punch_ticket ].each do |method|
            it { should respond_to method }
          end
        end

        describe 'Properties' do
          subject { TicketGate::Client::Ticket }

          [ :barcode, :created_at, :id, :person_id, :punched, :purchase_id, :ticket_category_id, :updated_at ].each do |property|
            its(:properties) { should include property }
          end
        end
      end

      describe 'Ticket category' do
        describe 'Methods' do
          [ :list_ticket_categories, :get_ticket_category, :create_ticket_category, :update_ticket_category, :destroy_ticket_category ].each do |method|
            it { should respond_to method }
          end
        end

        describe 'Properties' do
          subject { TicketGate::Client::TicketCategory }

          [ :created_at, :currency, :description, :event_id, :id, :name, :price, :ticket_limit, :updated_at ].each do |property|
            its(:properties) { should include property }
          end
        end
      end

      describe 'Venue' do
        describe 'Methods' do
          [ :list_venues, :get_venue, :create_venue, :update_venue, :destroy_venue ].each do |method|
            it { should respond_to method }
          end
        end

        describe 'Properties' do
          subject { TicketGate::Client::Venue }

          [ :created_at, :event_id, :id, :name, :updated_at ].each do |property|
            its(:properties) { should include property }
          end
        end
      end
    end
  end
end