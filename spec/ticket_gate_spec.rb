require "spec_helper"

describe TicketGate do
  describe TicketGate::Client do
    describe 'Setup' do
      subject { TicketGate::Client }
      its(:version)  { should eq 1 }
      its(:base_uri) { should eq 'http://localhost:3000' }

      describe '#initialize' do
        it 'needs an access token' do
          expect {
            TicketGate::Client.new
          }.to raise_exception 'Please initialize with your api access token'
        end

        it 'works' do
          tg = TicketGate::Client.new('123')
          tg.instance_variable_get(:@access_token).should eq '123'
        end
      end

      describe '#base_request_options' do
        specify { TicketGate::Client.new('123').base_request_options.should eq({ :headers => { 'Authorization' => ActionController::HttpAuthentication::Token.encode_credentials('123') } }) }
      end
    end
  end
end