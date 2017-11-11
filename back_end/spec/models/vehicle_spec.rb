require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe "Associations" do
    
    it 'has one location' do
      location_association = described_class.reflect_on_association(:location)
      expect(location_association.macro).to eq :has_one
    end

    it 'persists after de-registration' do
      vehicle = Vehicle.create!
      vehicle.archive
      expect(vehicle.archived).to eq(true)
    end

    it 'returns only non-archived vehicles' do
      vehicle_1 = Vehicle.create!
      vehicle_2 = Vehicle.create!.archive
      expect(Vehicle.all.count).to eq(1)
    end

    it 'returns a list with vehicles that have locations' do
      vehicle_1 = Vehicle.create!
      vehicle_2 = Vehicle.create!
      vehicle_3 = Vehicle.create!

      vehicle_1.location = Location.new(lat: 10.0, lng: 10.0, at: Time.now)
      vehicle_1.save

      vehicle_2.location = Location.new(lat: 10.0, lng: 10.0, at: Time.now)
      vehicle_2.save

      expect(Vehicle.with_location.count).to eq(2)
    end

  end
end
