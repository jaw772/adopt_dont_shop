class AdminApplicationsController < ApplicationController
  def initialize
    @status = " "
  end

  def show
    if params[:approve].present?
      if params[:approve] == "true"
        @status = "Approved"
      else
        @status = "Rejected"
      end
    end
    @application = Application.find(params[:id])
    @app_pets = AdoptablePet.where(application_id: @application.id)
    @adoption_pets = @app_pets.map{|pet| Pet.find(pet.pet_id)}
    # @status = @@status
  end
end
