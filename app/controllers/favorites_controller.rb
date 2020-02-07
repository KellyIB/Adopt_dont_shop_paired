class FavoritesController < ApplicationController

  def index
    favorites
  end

  def update
    pet = Pet.find(params[:pet_id])
    favorites = Favorite.new(session[:favorites])
    favorites.add_pet(pet)
    session[:favorites] = favorites.contents
    flash[:success] = "#{pet.name} Was Favorited!"
    redirect_to "/pets/#{pet.id}"
  end

  def destroy
    pet = Pet.find(params[:pet_id])
    favorites.remove_pet(pet)
    flash[:notice] = "#{pet.name} has been removed from your favorites"
    if URI(request.referer).path == "/favorites"
      redirect_to "/favorites"
    else URI(request.referer).path == "/pets/#{pet.id}"
      redirect_to "/pets/#{pet.id}"
    end
  end

  def destroy_all
    favorites.remove_all
    session[:favorites] = @favorites.contents
    flash[:success] = "You have removed all pets from your favorites list."
    redirect_to '/favorites'
  end
end
