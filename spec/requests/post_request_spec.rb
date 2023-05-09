require 'rails_helper'

RSpec.describe "Posts", type: :request do
    describe "GET /index" do
        it "returns http success" do
            get '/users/1/posts'

            expect(response).to have_http_status(:success)
            expect(response.body).to_not be_empty
            expect(response.body).to include('Here is a list of posts for a given user')
        end
    end

    describe "GET /show" do
        it "returns http success" do
            get '/users/1/posts/1'

            expect(response).to have_http_status(:success)
            expect(response.body).to_not be_empty
            expect(response.body).to include('Here is a post by a current user')
        end
    end 
end