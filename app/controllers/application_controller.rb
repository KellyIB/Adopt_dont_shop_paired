class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :favorites, :pet_in_favorites?

  def favorites
    @favorites ||= Favorite.new(session[:favorites])
  end

  def pet_in_favorites?(pet)
    favorites.contents.include?(pet)
  end

end
