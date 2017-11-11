class Vehicle
  include Mongoid::Document
  field :archived, type: Boolean
  has_one :location, dependent: :destroy

  default_scope { where(archived: false) }
  
  def self.with_location
    all.select{ |vehicle| vehicle.location.present?  }
  end

  def archive
    self.archived = true
    self.save
  end

end
