require 'rails_helper'

describe "Shelter edit page" do
  describe "As a visitor" do
    before :each do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")
      @boulder_rescue = Shelter.create(name: "Boulder Rescue", address: "2712 Slobbery Circle", city: "Boulder", state: "CO", zip: "80205")

      visit "/shelters/#{@boulder_rescue.id}"
    end

    it "Update Shelter edits shelter information and routes user back to shelter show page" do

      click_link("Update #{@boulder_rescue.name}")
      expect(current_path).to eq("/shelters/#{@boulder_rescue.id}/edit")

      fill_in :name, with: "Bowlder Restqueue"
      fill_in :address, with: "742 Sleepy Road"
      fill_in :city, with: "Boulder"
      fill_in :state, with: "CO"
      fill_in :zip, with: "80205"
      click_button "Save Changes"

      expect(current_path).to eq("/shelters/#{@boulder_rescue.id}")
      expect(page).to have_content("Bowlder Restqueue")
      expect(page).to have_content("742 Sleepy Road")
      expect(page).to have_content("Boulder")
      expect(page).to have_content("CO")
      expect(page).to have_content("80205")
    end

    it "shows the 'Update Shelter' link under every shelter at '/shelters'" do
      visit '/shelters'

      within "#shelter-#{@howlin_puppers.id}" do
        click_link "Update #{@howlin_puppers.name}"
      end

      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}/edit")

      fill_in :name, with: "Puppers R Us"
      fill_in :address, with: "3482 Pupper Road"
      fill_in :city, with: "Fort Collins"
      fill_in :state, with: "CO"
      fill_in :zip, with: "85042"
      click_button "Save Changes"

      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}")
      expect(page).to have_content("Puppers R Us")
      expect(page).to have_content("3482 Pupper Road")
      expect(page).to have_content("Fort Collins")
      expect(page).to have_content("CO")
      expect(page).to have_content("85042")
    end
  end
end
