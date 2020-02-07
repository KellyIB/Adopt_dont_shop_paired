require 'rails_helper'

describe "As a visitor" do
  describe "Remove a favorited pet" do
    before :each do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")

      @artemis = @howlin_puppers.pets.create(image: "https://cdn.steemitimages.com/DQmUbxeLd9sLL3gCL8L8vtucbEdmEG5CCDQqTNLa2hZbsrW/IMG_20180611_200246_283.jpg",
        name: 'Artemis',
        approximate_age: 3,
        description: "People say I'm a dream",
        sex: 'Female')

      @tycho = @fantastic_friends.pets.create(image: "https://www.rover.com/blog/wp-content/uploads/2019/05/pupper-featured.png",
        name: 'Tycho',
        approximate_age: 3,
        description: "I'm somewhat of a troublemaker",
        sex: 'Male')

        visit "/pets/#{@artemis.id}"
        click_link("Add #{@artemis.name} to Favorites")

        visit "/pets/#{@tycho.id}"
        click_link("Add #{@tycho.name} to Favorites")
    end

    it "Removes a pet from favorites and decrements the indicator by 1" do

      visit '/favorites'

      within ".topnav" do
        expect(page).to have_content("You have 2 in Favorites.")
      end

      within "#favorite-#{@artemis.id}" do
        click_link "Remove #{@artemis.name} From Favorites"
      end

      expect(current_path).to eq('/favorites')
      expect(page).not_to have_css("img[src*='#{@artemis.image}']")

      within "#favorite-#{@tycho.id}" do
        expect(page).to have_css("img[src*='#{@tycho.image}']")
        expect(page).to have_content("Name: #{@tycho.name}")
      end

      within ".topnav" do
        expect(page).to have_content("You have 1 in Favorites.")
      end
    end

    it "Remove All From Favorites button removes all favorited pets" do

      visit '/favorites'

      within ".topnav" do
        expect(page).to have_content("You have 2 in Favorites.")
      end

      click_link "Remove All From Favorites"
      expect(current_path).to eq('/favorites')
      expect(page).to have_content('No Pets in Favorites')

      within ".topnav" do
        expect(page).to have_content("You have 0 in Favorites.")
      end
    end
  end
end
