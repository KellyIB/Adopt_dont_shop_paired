require 'rails_helper'

RSpec.describe "pets index page" do
  describe "as a visitor" do
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

      visit '/pets'
    end

    it "shows each pets name, image, aprox age, sex and shelter they are located at" do
      within "#pet-#{@rue.id}" do
        expect(page).to have_css("img[src*='#{@rue.image}']")
        expect(page).to have_content("Name: #{@rue.name}")
        expect(page).to have_content("Age: #{@rue.approximate_age}")
        expect(page).to have_content("Sex: #{@rue.sex}")
        expect(page).to have_content("Current Shelter: #{@rue.shelter.name}")
      end

      within "#pet-#{@artemis.id}" do
        expect(page).to have_css("img[src*='#{@artemis.image}']")
        expect(page).to have_content("Name: #{@artemis.name}")
        expect(page).to have_content("Age: #{@artemis.approximate_age}")
        expect(page).to have_content("Sex: #{@artemis.sex}")
        expect(page).to have_content("Current Shelter: #{@artemis.shelter.name}")
      end

      within "#pet-#{@tycho.id}" do
        expect(page).to have_css("img[src*='#{@tycho.image}']")
        expect(page).to have_content("Name: #{@tycho.name}")
        expect(page).to have_content("Age: #{@tycho.approximate_age}")
        expect(page).to have_content("Sex: #{@tycho.sex}")
        expect(page).to have_content("Current Shelter: #{@tycho.shelter.name}")
      end

      within "#pet-#{@cody.id}" do
        expect(page).to have_css("img[src*='#{@cody.image}']")
        expect(page).to have_content("Name: #{@cody.name}")
        expect(page).to have_content("Age: #{@cody.approximate_age}")
        expect(page).to have_content("Sex: #{@cody.sex}")
        expect(page).to have_content("Current Shelter: #{@cody.shelter.name}")
      end
    end
  end
end
