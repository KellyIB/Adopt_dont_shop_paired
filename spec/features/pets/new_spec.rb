require 'rails_helper'

describe 'As a visitor' do
  describe 'Shelter pet creation' do
    before(:each) do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")

      @name = "Medic"
      @description = "I'm a support healer"
      @age = 3
      @sex = "Male"
      @image = "https://external-preview.redd.it/zCMcFZnTgIea4vh2EfD_Z1q50LeBnITkWve6s5hoy2Y.jpg?auto=webp&s=429e693474bc59f984369cc1f0676942b921d061"

      visit "/shelters/#{@howlin_puppers.id}/pets"
    end

    it "shows a link to 'Create Pet' for that shelter" do
      visit "/shelters/#{@howlin_puppers.id}/pets"
      click_link "Create New Pet"

      # fill in form information
      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}/pets/new")
      fill_in :image, with: "#{@image}"
      fill_in :name, with: "#{@name}"
      fill_in :description, with: "#{@description}"
      fill_in :approximate_age, with: "#{@age}"
      fill_in :sex, with: "#{@sex}"
      click_on "Create Pet"

      new_pet = Pet.last

      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}/pets")
      within "#pet-#{new_pet.id}" do
        expect(page).to have_css("img[src*='#{@image}']")
        expect(page).to have_content(@name)
        expect(page).to have_content(@age)
        expect(page).to have_content(@sex)
      end
    end
  end
end
