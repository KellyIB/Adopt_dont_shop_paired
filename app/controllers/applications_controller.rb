class ApplicationsController < ApplicationController

  def new
  end

  def create
    check_pets = Pet.where(id: params[:favorites])
    application = Application.new(application_params)
    if application.save
      check_pets.each do |pet|
        pet.applications << application
        favorites.favorite_to_applied_for(pet.id)
      end
      redirect_to "/favorites"
      flash[:success] = "Your Application Was Submitted!"
    else
      flash[:error] = application.errors.full_messages.to_sentence
      redirect_to "/favorites/applications/new"
    end
  end

  def show
    @application = Application.find(params[:application_id])
  end

  private

  def application_params
    params.permit(:name, :address, :city, :state, :zip, :phone_number, :description)
  end


end
