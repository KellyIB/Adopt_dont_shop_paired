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
  end
end
