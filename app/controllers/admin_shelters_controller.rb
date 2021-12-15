class AdminSheltersController < ApplicationController
  def index
    @shelters = AdminShelter.reverse_shelter
    # @applicants = AdminShelter.applicants
  end
end
