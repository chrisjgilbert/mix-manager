require 'rails_helper'

describe Api::V1::MixesController do
  describe "GET 'index' " do
    it "returns a successful 200 response" do
       get :index, format: :json
      expect(response).to be_success
    end

    it "returns all the students" do
      FactoryBot.create_list(:mix, 5)
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['mixes'].length).to eq(5)
    end
  end
end
