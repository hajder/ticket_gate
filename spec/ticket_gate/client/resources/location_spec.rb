require "spec_helper"

describe 'Location' do
  subject { TicketGate::Client.new('123') }
  
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