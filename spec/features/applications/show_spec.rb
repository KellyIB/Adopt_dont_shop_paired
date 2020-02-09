require 'rails_helper'

describe "As a visitor" do
  describe "Application show page" do
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
      #
      # visit "/pets/#{@cody.id}"
      # click_link("Add #{@cody.name} to Favorites")
      #
      # visit "/pets/#{@tycho.id}"
      # click_link("Add #{@tycho.name} to Favorites")
      #
      # visit "/pets/#{@artemis.id}"
      # click_link("Add #{@artemis.name} to Favorites")

      @application_1 = Application.create!(name: "John Doe", address: "123 Anywhere St.", city: "Malibu", state: "Florida", zip: "50392", phone_number: "352-956-1248", description: "I hardly ever leave my house and I need company.")
      @application_2 = Application.create!(name: "Tin Lee", address: "926 Long Rd.", city: "Austin", state: "Texas", zip: "60636", phone_number: "345-954-1212", description: "Dogs amuse me and I'm bored often. I need entertainment.")

      ApplicationPet.create!(application: @application_1, pet: @cody)
      ApplicationPet.create!(application: @application_1, pet: @tycho)
      ApplicationPet.create!(application: @application_2, pet: @cody)
      ApplicationPet.create!(application: @application_2, pet: @artemis)
    end

    it "can see application information" do
      visit "/applications/#{@application_1.id}"
      expect(page).to have_content("#{@application_1.name}")
      expect(page).to have_content("#{@application_1.address}")
      expect(page).to have_content("#{@application_1.city}")
      expect(page).to have_content("#{@application_1.state}")
      expect(page).to have_content("#{@application_1.zip}")
      expect(page).to have_content("#{@application_1.phone_number}")
      expect(page).to have_content("#{@application_1.description}")
      expect(page).to have_content("#{@cody.name}")
      expect(page).to have_content("#{@tycho.name}")
      
      visit "/applications/#{@application_2.id}"
      expect(page).to have_content("#{@application_2.name}")
      expect(page).to have_content("#{@application_2.address}")
      expect(page).to have_content("#{@application_2.city}")
      expect(page).to have_content("#{@application_2.state}")
      expect(page).to have_content("#{@application_2.zip}")
      expect(page).to have_content("#{@application_2.phone_number}")
      expect(page).to have_content("#{@application_2.description}")
      expect(page).to have_content("#{@cody.name}")
      expect(page).to have_content("#{@artemis.name}")
    end

  end
end
