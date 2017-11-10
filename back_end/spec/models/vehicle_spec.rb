require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe "Associations" do
    it 'has one location' do
      location_association = described_class.reflect_on_association(:location)
      expect(location_association.macro).to eq :has_one
    end
  end
end
