require "spec_helper"

describe 'Person' do
  subject { TicketGate::Client.new('123') }
  
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