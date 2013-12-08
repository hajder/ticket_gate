require "spec_helper"

describe 'Purchase' do
  subject { TicketGate::Client.new('123') }
  
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