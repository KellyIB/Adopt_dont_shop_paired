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

      @rue = @howlin_puppers.pets.create(image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg",
        name: 'Rue',
        approximate_age: 1,
        description: "I'm sometimes a gargoyle",
        sex: 'Female')

      @cody = @fantastic_friends.pets.create!(image: "https://images2.minutemediacdn.com/image/upload/c_crop,h_2716,w_4827,x_0,y_314/f_auto,q_auto,w_1100/v1554924989/shape/mentalfloss/istock-627892528.jpg",
        name: 'Cody',
        approximate_age: 2,
        description: "I'm the best of boys",
        sex: 'Male')

      visit "/pets/#{@artemis.id}"
      click_link("Add #{@artemis.name} to Favorites")

      visit "/pets/#{@tycho.id}"
      click_link("Add #{@tycho.name} to Favorites")

      visit "/pets/#{@rue.id}"
      click_link("Add #{@rue.name} to Favorites")

      visit "/pets/#{@cody.id}"
      click_link("Add #{@cody.name} to Favorites")
    end

    it "Removes a pet from favorites and decrements the indicator by 1" do

      visit '/favorites'

      within ".topnav" do
        expect(page).to have_content("You have 4 in Favorites.")
      end

      within "#favorite-#{@artemis.id}" do
        click_link "Remove #{@artemis.name} From Favorites"
      end

      expect(current_path).to eq("/favorites")

      within ".topnav" do
        expect(page).to have_content("You have 3 in Favorites.")
      end

      expect(current_path).to eq('/favorites')
      expect(page).not_to have_css("img[src*='#{@artemis.image}']")

      within "#favorite-#{@tycho.id}" do
        expect(page).to have_css("img[src*='#{@tycho.image}']")
        expect(page).to have_content("Name: #{@tycho.name}")
      end

      visit "/pets/#{@cody.id}"
      click_link "Remove #{@cody.name} From Favorites"

      expect(current_path).to eq("/pets/#{@cody.id}")

      within ".topnav" do
        expect(page).to have_content("You have 2 in Favorites.")
      end
    end

    it "Remove All From Favorites button removes all favorited pets" do

      visit '/favorites'

      within ".topnav" do
        expect(page).to have_content("You have 4 in Favorites.")
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
