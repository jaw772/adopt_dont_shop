class AdminShelter < ApplicationRecord
  def self.reverse_shelter
    Shelter.find_by_sql("SELECT * FROM shelters ORDER BY shelters.name desc")
  end

  def self.applicants(shelter)
    # binding.pry
    Application.joins(:adoptable_pets => {:pet => :shelter}).where(:applications => {:status => "Pending"}, :shelters =>{:name => shelter.name})
    # app = Application.joins(:adoptable_pets => {:pet => :shelter}).where(:applications => {:status => "Pending"})
    # shelter = Shelter.joins(:pets => {:adoptable_pets => :application}).where(:applications => {:status => "Pending"})
  end

end
