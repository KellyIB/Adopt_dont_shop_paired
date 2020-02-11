require 'rails_helper'

RSpec.describe Shelter, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
  end

  describe "relationships" do
    it {should have_many(:pets)}
  end

  describe "instance methods" do
    it "pet_count" do
    howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
    rue = howlin_puppers.pets.create(image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg",
      name: 'Rue',
      approximate_age: 1,
      description: "I'm a gargoyle sometimes",
      sex: 'Female')

    brian = howlin_puppers.pets.create(image: "https://i.pinimg.com/originals/8f/a9/11/8fa91183ac378ec914a1f1f83a0df941.jpg",
      name: 'Brian',
      approximate_age: 12,
      description: "Crabs are people. Legit or quit!",
      sex: 'Male')

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

      expect(howlin_puppers.pet_count).to eq(4)
    end

    it "adoption_pending_check" do
      howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      boulder_rescue = Shelter.create(name: "Boulder Rescue", address: "2712 Slobbery Circle", city: "Boulder", state: "CO", zip: "80205")
      fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")

      artemis = howlin_puppers.pets.create(image: "https://cdn.steemitimages.com/DQmUbxeLd9sLL3gCL8L8vtucbEdmEG5CCDQqTNLa2hZbsrW/IMG_20180611_200246_283.jpg",
        name: 'Artemis',
        approximate_age: 3,
        description: "People say I'm a dream",
        sex: 'Female')

      tycho = howlin_puppers.pets.create(image: "https://www.rover.com/blog/wp-content/uploads/2019/05/pupper-featured.png",
        name: 'Tycho',
        approximate_age: 3,
        description: "I'm somewhat of a troublemaker",
        sex: 'Male',
        adoptable?: false)

      brian = boulder_rescue.pets.create(image: "https://i.pinimg.com/originals/8f/a9/11/8fa91183ac378ec914a1f1f83a0df941.jpg",
        name: 'Brian',
        approximate_age: 12,
        description: "Crabs are people. Legit or quit!",
        sex: 'Male')

      application = Application.create!(name: "John Doe", address: "123 Anywhere St.", city: "Malibu", state: "Florida", zip: "50392", phone_number: "352-956-1248", description: "I hardly ever leave my house and I need company.")
      ApplicationPet.create!(application: application, pet: artemis, approved?: true)


      expect(howlin_puppers.adoption_pending_check).to eq(true)
      expect(fantastic_friends.adoption_pending_check).to eq(false)
      expect(boulder_rescue.adoption_pending_check).to eq(false)
    end

    it "avg_rating" do
      howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      review_1 = howlin_puppers.reviews.create( title: "Amazing Experience!",
                                                rating: 5,
                                                content: "My experience at howlin' puppers was amazing!",
                                                image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg")

      review_2 = howlin_puppers.reviews.create( title: "Great place!",
                                                rating: 4,
                                                content: "It would be 5 milkbones, but they didn't have complimentary coffee")

      review_3 = howlin_puppers.reviews.create( title: "Amazing Experience!",
                                                rating: 5,
                                                content: "My experience at howlin' puppers was amazing!",
                                                image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/SNice.svg/1200px-SNice.svg.png")

      expect(howlin_puppers.avg_rating.round(1)).to eq(4.7)
    end

    it "applications_on_file" do
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

      application_1 = Application.create!(name: "John Doe", address: "123 Anywhere St.", city: "Malibu", state: "Florida", zip: "50392", phone_number: "352-956-1248", description: "I hardly ever leave my house and I need company.")
      application_2 = Application.create!(name: "Tin Lee", address: "926 Long Rd.", city: "Austin", state: "Texas", zip: "60636", phone_number: "345-954-1212", description: "Dogs amuse me and I'm bored often. I need entertainment.")

      ApplicationPet.create!(application: application_1, pet: cody)
      ApplicationPet.create!(application: application_1, pet: tycho)
      ApplicationPet.create!(application: application_2, pet: cody)
      ApplicationPet.create!(application: application_2, pet: artemis)

      expect(howlin_puppers.applications_on_file).to eq(2)
    end
  end
end
