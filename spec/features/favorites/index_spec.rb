# As a visitor
# When I have added pets to my favorites list
# And I visit my favorites index page ("/favorites")
# I see all pets I've favorited
# Each pet in my favorites shows the following information:
# - pet's name (link to pets show page)
# - pet's image

require 'rails_helper'

describe "As a visitor" do
  describe "Favorites index page" do
    before :each do
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
        approximate_age: 3,
        description: "I'm somewhat of a troublemaker",
        sex: 'Male')

      @cody = @fantastic_friends.pets.create!(image: "https://images2.minutemediacdn.com/image/upload/c_crop,h_2716,w_4827,x_0,y_314/f_auto,q_auto,w_1100/v1554924989/shape/mentalfloss/istock-627892528.jpg",
        name: 'Cody',
        approximate_age: 2,
        description: "I'm the best of boys",
        sex: 'Male')
    end

    it "I see all of my favorites pets" do
      visit "/pets/#{@rue.id}"
      click_link("Add #{@rue.name} to Favorites")

      visit "/pets/#{@artemis.id}"
      click_link("Add #{@artemis.name} to Favorites")

      visit "/pets/#{@cody.id}"
      click_link("Add #{@cody.name} to Favorites")

      within ".topnav" do
        click_link 'Favorites'
      end

      expect(current_path).to eq('/favorites')

      within "#favorite-#{@rue.id}" do
        expect(page).to have_css("img[src*='#{@rue.image}']")
        expect(page).to have_content("Name: #{@rue.name}")
      end

      within "#favorite-#{@artemis.id}" do
        expect(page).to have_css("img[src*='#{@artemis.image}']")
        expect(page).to have_content("Name: #{@artemis.name}")
      end

      within "#favorite-#{@cody.id}" do
        expect(page).to have_css("img[src*='#{@cody.image}']")
        expect(page).to have_content("Name: #{@cody.name}")
      end
    end
  end
end
