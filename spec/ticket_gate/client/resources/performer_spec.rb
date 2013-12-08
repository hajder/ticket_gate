require "spec_helper"

describe 'Performer' do
  subject { TicketGate::Client.new('123') }
  
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