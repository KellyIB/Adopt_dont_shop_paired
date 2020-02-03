require 'rails_helper'

describe "Delete pet" do
  describe "As a visitor on a pets show page" do
    before(:each) do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")

      @rue = @howlin_puppers.pets.create(image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg",
        name: 'Rue',
        approximate_age: 1,
        description: "I'm sometimes a gargoyle",
        sex: 'Female')

      @artemis = @howlin_puppers.pets.create(image: "https://cdn.steemitimages.com/DQmUbxeLd9sLL3gCL8L8vtucbEdmEG5CCDQqTNLa2hZbsrW/IMG_20180611_200246_283.jpg",
        name: 'Artemis',
        approximate_age: 3,
        description: "People say I'm a dream",
        sex: 'Female')

      @tycho = @fantastic_friends.pets.create(image: "https://www.rover.com/blog/wp-content/uploads/2019/05/pupper-featured.png",
        name: 'Tycho',
        approximate_age: 7,
        description: "I'm somewhat of a troublemaker",
        sex: 'Male')
    end

    it "I see a button to delete pet, and when I click it the pet is deleted
        and I'm redirected to the pet index page" do

      visit "/pets/#{@rue.id}"
      click_link "Delete Pet Profile"

      expect(current_path).to eq("/pets")
      expect(page).to_not have_css("img[src*='#{@rue.image}']")
      expect(page).to_not have_content("#{@rue.name}")
      expect(page).to_not have_content("#{@rue.approximate_age}")
    end

    it "Pet index page shows delete link under each pet displayed" do
      visit '/pets'

      within "#pet-#{@tycho.id}" do
        click_link "Delete Pet Profile"
      end

      expect(current_path).to eq("/pets")
      expect(page).to_not have_css("img[src*='#{@tycho.image}']")
      expect(page).to_not have_content("#{@tycho.name}")
      expect(page).to_not have_content("#{@tycho.approximate_age}")
    end
  end
end
