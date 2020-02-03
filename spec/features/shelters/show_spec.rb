require 'rails_helper'

describe "shelter show page" do
  describe "as a visitor" do
    before :each do
      @boulder_rescue = Shelter.create(name: "Boulder Rescue", address: "2712 Slobbery Circle", city: "Boulder", state: "CO", zip: "80205")
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")
    end

    it "when I visit a shelter show page I see the shelters name,
      address, city, state, and zip" do

      visit '/shelters'
      click_link("#{@fantastic_friends.name}")
      expect(current_path).to eq("/shelters/#{@fantastic_friends.id}")
      expect(page).to have_content("Fantastic friends")
      expect(page).to have_content("9872 Friendly Lane")
      expect(page).to have_content("New York City")
      expect(page).to have_content("NY")
      expect(page).to have_content("10001")

      visit '/shelters'
      click_link("#{@boulder_rescue.name}")
      expect(current_path).to eq("/shelters/#{@boulder_rescue.id}")
      expect(page).to have_content("Boulder Rescue")
      expect(page).to have_content("2712 Slobbery Circle")
      expect(page).to have_content("Boulder")
      expect(page).to have_content("CO")
      expect(page).to have_content("80205")
    end
  end
end
