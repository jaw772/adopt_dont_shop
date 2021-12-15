class AdoptablePet < ApplicationRecord
  belongs_to :application
  belongs_to :pet
  # def find_pets
  #   self.map{|pet| Pet.find(pet.pet_id)}
  # end
end
