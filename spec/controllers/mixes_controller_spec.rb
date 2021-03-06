require 'rails_helper'

describe Api::V1::MixesController do

  describe "GET 'index' " do
    it "returns a 200 response" do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end
    it "returns all the students" do
      FactoryBot.create_list(:mix, 5)
      get :index, format: :json
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to eq(5)
    end
  end

  describe "POST 'create' " do
    def create_mix_action
      mix = FactoryBot.build(:mix)
      post :create, params: { mix: { title: mix.title, description: mix.description, url: mix.url } }
    end
    it "returns a 200 response" do
      create_mix_action
      expect(response).to have_http_status(200)
    end
    it "creates a mix in the database" do
      create_mix_action
      expect { create_mix_action }.to change { Mix.count }.by(1)
    end
  end

  describe "DESTROY 'delete' " do
    let!(:mix) { FactoryBot.create(:mix) }
    def delete_mix_action
      delete :destroy, params: { id: mix.id }
    end
    it "returns a 200 response" do
      delete_mix_action
      expect(response).to have_http_status(200)
    end
    it "deletes a mix from the database" do
      expect { delete_mix_action }.to change { Mix.count }.by(-1)
    end
  end

  describe "PATCH 'update'" do
    let!(:mix) { FactoryBot.create(:mix) }
    it "returns a 200 response" do
      patch :update, params: { id: mix.id, mix: { title: mix.id, description: mix.description, url: mix.url } }
      expect(response).to have_http_status(200)
    end

    it "returns updates mix from the db" do
      patch :update, params: { id: mix.id, mix: { title: 'updated title', description: 'updated description', url: 'updated url' } }
      parsed_response = JSON.parse(response.body)
      expect(parsed_response['title']).to eq('updated title')
      expect(parsed_response['description']).to eq('updated description')
      expect(parsed_response['url']).to eq('updated url')
    end
  end
end
