require 'rails_helper'

describe "shelter show page" do
  describe "as a visitor" do
    before :each do
      @boulder_rescue = Shelter.create(name: "Boulder Rescue", address: "2712 Slobbery Circle", city: "Boulder", state: "CO", zip: "80205")
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")
    end

    it "when I visit a shelter show page I see the shelters name,
      address, city, state, and zip" do

      visit '/shelters'
      click_link("#{@fantastic_friends.name}")
      expect(current_path).to eq("/shelters/#{@fantastic_friends.id}")
      expect(page).to have_content("Fantastic friends")
      expect(page).to have_content("9872 Friendly Lane")
      expect(page).to have_content("New York City")
      expect(page).to have_content("NY")
      expect(page).to have_content("10001")

      visit '/shelters'
      click_link("#{@boulder_rescue.name}")
      expect(current_path).to eq("/shelters/#{@boulder_rescue.id}")
      expect(page).to have_content("Boulder Rescue")
      expect(page).to have_content("2712 Slobbery Circle")
      expect(page).to have_content("Boulder")
      expect(page).to have_content("CO")
      expect(page).to have_content("80205")
    end

    it "shows statistics for that shelter" do
      howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")

      artemis = howlin_puppers.pets.create(image: "https://cdn.steemitimages.com/DQmUbxeLd9sLL3gCL8L8vtucbEdmEG5CCDQqTNLa2hZbsrW/IMG_20180611_200246_283.jpg",
                                            name: 'Artemis',
                                            approximate_age: 3,
                                            description: "People say I'm a dream",
                                            sex: 'Female')

      tycho = howlin_puppers.pets.create(image: "https://www.rover.com/blog/wp-content/uploads/2019/05/pupper-featured.png",
                                            name: 'Tycho',
                                            approximate_age: 3,
                                            description: "I'm somewhat of a troublemaker",
                                            sex: 'Male')

      cody = howlin_puppers.pets.create!(image: "https://images2.minutemediacdn.com/image/upload/c_crop,h_2716,w_4827,x_0,y_314/f_auto,q_auto,w_1100/v1554924989/shape/mentalfloss/istock-627892528.jpg",
                                            name: 'Cody',
                                            approximate_age: 2,
                                            description: "I'm the best of boys",
                                            sex: 'Male')

      review_1 = howlin_puppers.reviews.create(title: "Amazing Experience!",
                                                rating: "5",
                                                content: "My experience at howlin' puppers was amazing!",
                                                image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg")

      review_2 = howlin_puppers.reviews.create(title: "Great place!",
                                                rating: "4",
                                                content: "It would be 5 milkbones, but they didn't have complimentary coffee")

      review_3 = fantastic_friends.reviews.create(title: "Amazing Experience!",
                                                rating: "5",
                                                content: "My experience at howlin' puppers was amazing!",
                                                image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/SNice.svg/1200px-SNice.svg.png")

      application_1 = Application.create!(name: "John Doe", address: "123 Anywhere St.", city: "Malibu", state: "Florida", zip: "50392", phone_number: "352-956-1248", description: "I hardly ever leave my house and I need company.")
      application_2 = Application.create!(name: "Tin Lee", address: "926 Long Rd.", city: "Austin", state: "Texas", zip: "60636", phone_number: "345-954-1212", description: "Dogs amuse me and I'm bored often. I need entertainment.")

      ApplicationPet.create!(application: application_1, pet: cody)
      ApplicationPet.create!(application: application_1, pet: tycho)
      ApplicationPet.create!(application: application_2, pet: cody)
      ApplicationPet.create!(application: application_2, pet: artemis)

      visit "/shelters/#{howlin_puppers.id}"

      within "#statistics" do
        expect(page).to have_content("Pet Count: 3")
        expect(page).to have_content("Average Rating: 4.7")
        expect(page).to have_content("Application On File: 2")
      end
    end
  end
end
