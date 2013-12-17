require "spec_helper"

describe 'Ticket category' do
  subject { TicketGate::Client.new('123') }
  
  describe 'Methods' do
    [ :list_ticket_categories, :get_ticket_category, :create_ticket_category, :update_ticket_category, :destroy_ticket_category ].each do |method|
      it { should respond_to method }
    end
  end

  describe 'Properties' do
    subject { TicketGate::Client::TicketCategory }

    [ :created_at, :description, :event_id, :id, :include_qr_code, :name, :price, :sales_end_at, :ticket_limit, :updated_at ].each do |property|
      its(:properties) { should include property }
    end
  end
end