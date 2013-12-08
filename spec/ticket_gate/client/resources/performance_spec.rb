require "spec_helper"     

describe 'Performance' do
  subject { TicketGate::Client.new('123') }
  
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