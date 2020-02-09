class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :favorites, :pet_in_favorites?, :pets_applied_for

  def favorites
    @favorites ||= Favorite.new(session[:favorites])
  end

  def pet_in_favorites?(pet)
    favorites.contents.include?(pet)
  end

  def pets_applied_for
    @pets_with_apps = Pet.all.select{|pet| !pet.applications.empty?}
  end
end
