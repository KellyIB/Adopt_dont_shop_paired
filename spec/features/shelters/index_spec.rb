require 'rails_helper'

describe "shelter index page" do
  describe "as a visitor" do
    before :each do
      @boulder_rescue = Shelter.create(name: "Boulder Rescue", address: "2712 Slobbery Circle", city: "Boulder", state: "CO", zip: "80205")
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")

      visit "/shelters"
    end

    it "shows the name of each shelter in the system" do
      expect(page).to have_content(@boulder_rescue.name)
      expect(page).to have_content("Boulder Rescue")
      expect(page).to have_content(@howlin_puppers.name)
      expect(page).to have_content("Howlin' Puppers")
      expect(page).to have_content(@fantastic_friends.name)
      expect(page).to have_content("Fantastic friends")
    end
  end
end
