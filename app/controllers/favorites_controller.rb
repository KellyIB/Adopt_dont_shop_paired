class FavoritesController < ApplicationController

  def index
    @favorited_pets = favorites.contents
  end

  def update
    pet = Pet.find(params[:pet_id])
    favorites = Favorite.new(session[:favorites])
    favorites.add_pet(pet)
    session[:favorites] = favorites.contents
    flash[:success] = "#{pet.name} Was Favorited!"
    redirect_to "/pets/#{pet.id}"
  end
end
