require 'rails_helper'

RSpec.describe LocationsController, type: :routing do
  describe 'routing' do
    it 'routes to #create' do
      expect(:post => '/vehicles/1/locations').to route_to('locations#create', vehicle_id: "1")
    end
  end
end
