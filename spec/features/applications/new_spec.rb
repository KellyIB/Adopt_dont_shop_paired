require 'rails_helper'

describe "As a visitor" do
  describe "make a new application" do
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
        approximate_age: 3,
        description: "I'm somewhat of a troublemaker",
        sex: 'Male')

      @cody = @fantastic_friends.pets.create!(image: "https://images2.minutemediacdn.com/image/upload/c_crop,h_2716,w_4827,x_0,y_314/f_auto,q_auto,w_1100/v1554924989/shape/mentalfloss/istock-627892528.jpg",
        name: 'Cody',
        approximate_age: 2,
        description: "I'm the best of boys",
        sex: 'Male')

      visit "/pets/#{@cody.id}"
      click_link("Add #{@cody.name} to Favorites")

      visit "/pets/#{@tycho.id}"
      click_link("Add #{@tycho.name} to Favorites")

      visit "/pets/#{@artemis.id}"
      click_link("Add #{@artemis.name} to Favorites")

      visit "/favorites"
    end

    it "can make a new application from the favorites index" do

      click_link "Apply to Adopt"
      expect(current_path).to eq("/favorites/applications/new")

      within "#app-pet-#{@tycho.id}" do
        check("favorites[]")
      end

      within "#app-pet-#{@artemis.id}" do
        check("favorites[]")
      end

      fill_in :name, with: "John Doe"
      fill_in :address, with: "123 easy st"
      fill_in :city, with: "LA"
      fill_in :state, with: "CA"
      fill_in :zip, with: "80009"
      fill_in :phone_number, with: "602 963 1504"
      fill_in :description, with: "I like dogs and I only have 5"
      click_on "Submit Application"

      expect(current_path).to eq("/favorites")
      expect(page).to have_content("Your Application Was Submitted!")
      expect(page).to have_content("#{@cody.name}")
      expect(page).to_not have_content("#{@tycho.name}")
      expect(page).to_not have_content("#{@artemis.name}")
    end

    it "will see an error message when submitting an incomplete new application" do

      click_link "Apply to Adopt"
      expect(current_path).to eq("/favorites/applications/new")

      within "#app-pet-#{@tycho.id}" do
        check("favorites[]")
      end

      within "#app-pet-#{@artemis.id}" do
        check("favorites[]")
      end

      fill_in :name, with: "John Doe"
      fill_in :address, with: "123 easy st"
      fill_in :city, with: "LA"
      fill_in :state, with: "CA"
      fill_in :zip, with: ""
      fill_in :phone_number, with: "602 963 1504"
      fill_in :description, with: "I like dogs and I only have 5"
      click_on "Submit Application"

      expect(page).to have_content("")
      expect(current_path).to eq("/favorites/applications/new")
    end

    it "shows all pets applied for" do
      click_link "Apply to Adopt"
      expect(current_path).to eq("/favorites/applications/new")

      within "#app-pet-#{@tycho.id}" do
        check("favorites[]")
      end

      within "#app-pet-#{@artemis.id}" do
        check("favorites[]")
      end

      fill_in :name, with: "John Doe"
      fill_in :address, with: "123 easy st"
      fill_in :city, with: "LA"
      fill_in :state, with: "CA"
      fill_in :zip, with: "80009"
      fill_in :phone_number, with: "602 963 1504"
      fill_in :description, with: "I like dogs and I only have 5"
      click_on "Submit Application"

      within"#pets-applied-for" do
        expect(page).to have_content("#{@tycho.name}")
        expect(page).to have_content("#{@artemis.name}")
      end
    end
  end
end
