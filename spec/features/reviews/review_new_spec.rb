require 'rails_helper'

describe "As a visitor" do
  describe "Creation of review at the Shelter Show Page" do
    before(:each) do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")
    end

    it "I see a link to add a review for that shelter" do
      visit "/shelters/#{@howlin_puppers.id}"

      click_link "New Review"
      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}/reviews/new")

      fill_in :title, with: "It didn't smell that bad."
      fill_in :rating, with: "3 Milkbones"
      fill_in :content, with: "I was surprised that it didn't smell that bad. There are a lot of pets here. #Febreeze?"
      click_button "Submit Review"

      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}")
      expect(page).to have_content("It didn't smell that bad.")
      expect(page).to have_content("3 Milkbones")
      expect(page).to have_content("I was surprised that it didn't smell that bad. There are a lot of pets here. #Febreeze?")
    end

    it "I see a flash message when I try to submit an incomplete form" do
      visit "/shelters/#{@howlin_puppers.id}/reviews/new"

      fill_in :title, with: "It didn't smell that bad."
      fill_in :content, with: "I was surprised that it didn't smell that bad. There are a lot of pets here. #Febreeze?"
      click_button "Submit Review"

      expect(page).to have_content("Rating can't be blank")
    end
  end
end
