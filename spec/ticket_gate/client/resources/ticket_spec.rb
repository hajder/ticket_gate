require "spec_helper"

describe 'Ticket' do
  subject { TicketGate::Client.new('123') }
  
  describe 'Methods' do
    [ :list_tickets, :get_ticket, :update_ticket, :destroy_ticket, :deliver_ticket, :punch_ticket ].each do |method|
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