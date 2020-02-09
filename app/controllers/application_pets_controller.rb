class ApplicationPetsController < ApplicationController

  def index
    @pet_applications = (Pet.find(params[:pet_id])).applications
  end

end
