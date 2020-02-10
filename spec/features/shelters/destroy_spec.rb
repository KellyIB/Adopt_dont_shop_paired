require 'rails_helper'

describe "Delete a shelter" do
  describe "As a visitor I can delete shelters" do
    before :each do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")
      @boulder_rescue = Shelter.create(name: "Boulder Rescue", address: "2712 Slobbery Circle", city: "Boulder", state: "CO", zip: "80205")

    end

    it "Shelter show page delete functionality" do
      visit "/shelters/#{@boulder_rescue.id}"

      click_link "Delete Shelter"
      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content("Boulder Rescue")
    end

    it "Shelter index page shows delete button next to each listed shelter" do
      visit "/shelters"

      within "#shelter-#{@fantastic_friends.id}" do
        click_link "Delete Shelter"
      end

      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content("Fantastic friends")
    end

    it "deleting a shelter deletes its reviews" do
      howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")

      review_1 = fantastic_friends.reviews.create(title: "Amazing Experience!",
                                                rating: "5 Milkbones",
                                                content: "My experience at howlin' puppers was amazing!",
                                                image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg")

      title = "It didn't smell that bad."
      rating = 3
      content = "I was surprised that it didn't smell that bad. There are a lot of pets here. #Febreeze?"

      visit "/shelters/#{howlin_puppers.id}/reviews/new"

      fill_in :title, with: title
      fill_in :rating, with: rating
      fill_in :content, with: content
      click_button "Submit Review"

      review_test = Review.last

      within "#review-#{review_test.id}" do
        expect(page).to have_content("It didn't smell that bad.")
        expect(page).to have_content(3)
        expect(page).to have_content("I was surprised that it didn't smell that bad. There are a lot of pets here. #Febreeze?")
      end

      visit "/shelters"

      within "#shelter-#{howlin_puppers.id}" do
        click_link "Delete Shelter"
      end

      expect(Review.last.title).not_to eq("It didn't smell that bad.")
    end
  end
end
