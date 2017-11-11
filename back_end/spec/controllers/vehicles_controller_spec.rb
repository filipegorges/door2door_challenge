require 'rails_helper'
require 'securerandom'

RSpec.describe VehiclesController, type: :controller do

  let(:valid_attributes) { { id: SecureRandom.uuid } }

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "Vehicle registration" do
      it "register a vehicle" do
        expect {
          post :create, params: valid_attributes
        }.to change(Vehicle, :count).by(1)
      end

      it "has status code 204 and empty reponse body" do
        post :create, params: valid_attributes
        expect(response).to be_no_content
        expect(response.body).to be_empty
      end
    end
  end

  describe "DELETE #destroy" do
    context "Vehicle de-registration" do
      before(:each) do
        @vehicle = Vehicle.create! valid_attributes
      end

      it "de-register vehicle" do
        expect {
          delete :destroy, params: {id: @vehicle.to_param}
        }.to change(Vehicle, :count).by(-1)
      end

      it "has status code 204 and empty reponse body" do
        delete :destroy, params: {id: @vehicle.to_param}
        expect(response).to be_no_content
        expect(response.body).to be_empty
      end
    end
  end

end
