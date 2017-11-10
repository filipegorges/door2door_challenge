require 'securerandom'

FactoryBot.define do
  factory :vehicle do
    sequence(:id)
  end

  factory :invalid_vehicle, class: Vehicle do
    id nil
  end
end
