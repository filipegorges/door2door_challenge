require 'rails_helper'

RSpec.describe Door2DoorLocation do
  describe 'Germany' do
    context 'Berlim' do
      it 'has the site\'s coordinates' do
        expect(Door2DoorLocation.berlim_site).to eq({ lat: 52.53, lng: 13.403 })
      end

      it 'has the site\'s boundaries ' do
        expect(Door2DoorLocation.berlim_site_boundaries).to eq({ max_lat: 52.5350, max_lng: 13.453 })
      end
    end
  end
end
