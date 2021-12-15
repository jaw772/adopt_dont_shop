class ApplicationShelter < ApplicationRecord
  belongs_to :application
  belongs_to :shelter

  def applicants
    binding.pry
    @applicant = Admin.joins(:pets => {:adoptable_pets => :applications}).where(status: "Pending")
  end
end
