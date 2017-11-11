require 'rails_helper'
require 'securerandom'

RSpec.describe LocationsController, type: :controller do

  let(:vehicle) { Vehicle.create! }

  let(:valid_attributes) { { vehicle_id: vehicle.id.to_s, 
    location: { 
      vehicle_id: vehicle.id.to_s, "lat": 10.0, "lng": 20.0,
      "at": "2017-09-01T12:00:00Z" } 
    }
  }

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
