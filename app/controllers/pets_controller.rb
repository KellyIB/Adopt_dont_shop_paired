class PetsController < ApplicationController
  def index
    @pets = Pet.all.adoptable_pet_sort
  end

  def show
    @pet = Pet.find(params[:pet_id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    shelter = Shelter.find(params[:shelter_id])
    pet = shelter.pets.new(pet_params)
    pet.save
    redirect_to "/shelters/#{shelter.id}/pets"
  end

  def edit
    @pet = Pet.find(params[:pet_id])
  end

  def update
    pet = Pet.find(params[:pet_id])
    pet.update(pet_params)
    pet.save
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.destroy(params[:pet_id])
    redirect_to '/pets'
  end

  private

  def pet_params
    params.permit(:name, :approximate_age, :description, :sex, :image)
  end
end
