class FavoritesController < ApplicationController

  def update
    pet = Pet.find(params[:pet_id])
    favorites = Favorite.new(session[:favorites])
    favorites.add_pet(pet.id)
    session[:favorites] = favorites.contents
    flash[:success] = "#{pet.name} Was Favorited!"
    redirect_to "/pets/#{pet.id}"
  end
end
