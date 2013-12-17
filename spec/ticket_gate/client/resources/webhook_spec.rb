require "spec_helper"

describe 'Webhook' do
  subject { TicketGate::Client.new('123') }
  
  describe 'Methods' do
    [ :list_webhooks, :get_webhook, :create_webhook, :update_webhook, :destroy_webhook ].each do |method|
      it { should respond_to method }
    end
  end

  describe 'Properties' do
    subject { TicketGate::Client::Webhook }

    [:created_at, :id, :updated_at, :url].each do |property|
      its(:properties) { should include property }
    end
  end
end