class AdminShelter < ApplicationRecord
  def self.reverse_shelter
    Shelter.find_by_sql("SELECT * FROM shelters ORDER BY shelters.name desc")
  end

  def self.applicants(shelter)
    Application.joins(:adoptable_pets => {:pet => :shelter}).where(:applications => {:status => "Pending"}, :shelters =>{:name => shelter.name})
  end

end
