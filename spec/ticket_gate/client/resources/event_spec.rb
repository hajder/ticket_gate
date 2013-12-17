require "spec_helper"

describe 'Event' do
  subject { TicketGate::Client.new('123') }
  
  describe 'Methods' do
    [ :list_events, :get_event, :create_event, :update_event, :destroy_event ].each do |method|
      it { should respond_to method }
    end
  end

  describe 'Properties' do
    subject { TicketGate::Client::Event }

    [ :created_at, :currency, :end_at, :id, :name, :parent_id, :start_at, :ticket_limit, :updated_at ].each do |property|
      its(:properties) { should include property }
    end
  end
end