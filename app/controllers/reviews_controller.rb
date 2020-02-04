class ReviewsController < ApplicationController

  def new
    @shelter = Shelter.find(params[:shelter_id])
  end

  def create
    @shelter = Shelter.find(params[:shelter_id])
    review = @shelter.reviews.new(review_params)
    if review.save
      redirect_to "/shelters/#{@shelter.id}"
    else
      flash[:error] = review.errors.full_messages.to_sentence
      render :new
    end
  end

  def review_params
    params.permit(:title, :rating, :content, :image)
  end


end
