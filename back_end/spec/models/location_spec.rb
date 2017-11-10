require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "Associations" do
    it 'belongs to a vehicle' do
      vehicle_association = described_class.reflect_on_association(:vehicle)
      expect(vehicle_association.macro).to eq :belongs_to
    end

    it 'should not monitor activity outside boundaries' do
      subject.lat = 60
      subject.lng = 60
      expect(subject).not_to be_valid
    end
  end
end
