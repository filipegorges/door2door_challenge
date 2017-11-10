class Vehicle
  include Mongoid::Document
  has_one :location, dependent: :destroy
end
