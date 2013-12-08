module TicketGate
  class Client < RocketPants::Client
    class Person < APISmith::Smash
      property :age
      property :birthday
      property :company_name
      property :created_at
      property :email
      property :first_name
      property :gender
      property :id
      property :job_title
      property :last_name
      property :phone_number
      property :prefix
      property :updated_at
    end

    def list_people
      get "people", :transformer => Person
    end

    def get_person id
      get "people/#{id}", :transformer => Person
    end

    def create_person params
      post "people", :extra_body => { :person => params }, :transformer => Person
    end

    def update_person id, params
      put "people/#{id}", :extra_body => { :person => params }, :transformer => Person
    end

    def destroy_person id
      delete "people/#{id}", :transformer => Person
    end
  end
end