require 'rails_helper'
require 'securerandom'

RSpec.describe LocationsController, type: :controller do

  let(:vehicle) { Vehicle.create! }

  let(:valid_attributes) {
    { vehicle_id: vehicle.id, "lat": 10.0, "lng": 20.0,
      "at": "2017-09-01T12:00:00Z" }
  }

  let(:invalid_attributes) {{ vehicle_id: nil, "lat": "", "lng": "", "at": "" }}

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'Location update' do
      it 'update the vehicle location' do
        expect {
          post :create, params: valid_attributes
        }.to change(Location, :count).by(1)
      end

      it 'has status 204 and empty response body' do
        post :create, params: valid_attributes
        expect(response).to be_no_content
        expect(response.body).to be_empty
      end
    end
  end
end
