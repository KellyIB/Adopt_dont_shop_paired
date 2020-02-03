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
      sex: 'Female',
      adoptable?: false)

    brian = howlin_puppers.pets.create(image: "https://i.pinimg.com/originals/8f/a9/11/8fa91183ac378ec914a1f1f83a0df941.jpg",
      name: 'Brian',
      approximate_age: 12,
      description: "Crabs are people. Legit or quit!",
      sex: 'Male',
      adoptable?: false)

    artemis = howlin_puppers.pets.create(image: "https://cdn.steemitimages.com/DQmUbxeLd9sLL3gCL8L8vtucbEdmEG5CCDQqTNLa2hZbsrW/IMG_20180611_200246_283.jpg",
      name: 'Artemis',
      approximate_age: 3,
      description: "People say I'm a dream",
      sex: 'Female',
      adoptable?: true)

    tycho = howlin_puppers.pets.create(image: "https://www.rover.com/blog/wp-content/uploads/2019/05/pupper-featured.png",
      name: 'Tycho',
      approximate_age: 3,
      description: "I'm somewhat of a troublemaker",
      sex: 'Male',
      adoptable?: true)

      expect(howlin_puppers.pet_count).to eq(4)
    end
  end
end
