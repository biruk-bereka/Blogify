require 'rails_helper'

RSpec.describe "Users", type: :request do
    
    describe "GET /index" do
        it "returns http success" do
            get '/users'

            payload = response.body
            
            # If response status was correct.
            expect(response).to have_http_status(:success)

            # Check if a correct template was rendered.
            expect(payload).to_not be_empty

            # Check if the response body includes correct placeholder text.
            expect(payload).to include('Here is a list of all users')

        end
    end

    describe "GET /show" do
        it "returns http success" do
            get '/users/1'
            
            payload = response.body
            
            # If response status was correct.
            expect(response).to have_http_status(:success)

            # Check if a correct template was rendered.
            expect(payload).to_not be_empty

            # Check if the response body includes correct placeholder text.
            expect(payload).to include('This is the current user')
        end
    end
end