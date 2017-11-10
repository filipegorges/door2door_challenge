class Vehicle
  include Mongoid::Document
  field :archived, type: Boolean
  has_one :location, dependent: :destroy

  def archive
    self.archived = true
  end
end
