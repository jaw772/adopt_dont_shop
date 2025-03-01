class Application < ApplicationRecord
 has_many :adoptable_pets
 has_many :pets, through: :adoptable_pets
 has_many :application_shelter
 has_many :shelters, through: :application_shelter
 validates :name, presence: true
 validates :street_address, presence: true
 validates :city, presence: true
 validates :state, presence: true
 validates :zipcode, presence: true

 def search_by_name_threshold(search)
   Pet.where("name iLIKE ?","%" + search + "%")
 end
 def adoption_threshold(active_app, pet)
   target_pet = Pet.find(pet)
   AdoptablePet.create!(application: active_app, pet: target_pet)
 end
end
