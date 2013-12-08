require "spec_helper"

describe 'Venue' do
  subject { TicketGate::Client.new('123') }
  
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