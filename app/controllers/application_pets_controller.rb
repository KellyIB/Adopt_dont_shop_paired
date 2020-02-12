class ApplicationPetsController < ApplicationController

  def index
    @pet_applications = (Pet.find(params[:pet_id])).applications
  end

  def approve
    @pet = Pet.find(params[:pet_id])
    @pet.update_column(:adoptable?, false)
    @applications_pet = ApplicationPet.where(pet_id: (params[:pet_id]), application_id: (params[:application_id])).first
    @applications_pet.update_column(:approved?, true)
    redirect_to "/pets/#{@pet.id}"
  end

  def revoke
    @pet = Pet.find(params[:pet_id])
    @pet.update_column(:adoptable?, true)
    @applications_pet = ApplicationPet.where(pet_id: (params[:pet_id]), application_id: (params[:application_id])).first
    @applications_pet.update_column(:approved?, false)
    redirect_to "/applications/#{params[:application_id]}"
  end
end
