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

  def edit
    @review = Review.find(params[:review_id])
    @shelter = Shelter.find(params[:shelter_id])
  end

  def update
    require 'pry'; binding 'pry'
    shelter = Shelter.find(params[:shelter_id])
    review = Pet.find(params[:review_id])
    review.update(review_params)
    review.save
    redirect_to "/reviews/#{shelter.id}"
  end





  private
    def review_params
      params.permit(:title, :rating, :content, :image)
    end


end
