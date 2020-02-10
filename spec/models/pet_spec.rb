require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe "validations" do
    it {should validate_presence_of(:image)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:approximate_age)}
    it {should validate_presence_of(:sex)}
    it {should validate_inclusion_of(:adoptable?).in_array([true, false])}
  end

  describe "relationships" do
    it {should belong_to(:shelter)}
    it {should have_many(:application_pets)}
    it {should have_many(:applications).through(:application_pets)}
  end

  describe "class methods" do
    it ".adoptable_pet_sort" do
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

      application_1 = Application.create!(name: "Tin Lee", address: "926 Long Rd.", city: "Austin", state: "Texas", zip: "60636", phone_number: "345-954-1212", description: "Dogs amuse me and I'm bored often. I need entertainment.")

      rue.applications << application_1
      brian.applications << application_1

      expected = [artemis, tycho, rue, brian]
      expect(Pet.adoptable_pet_sort).to eq(expected)
    end
end

describe "instance methods" do
    it "applicant_name" do
      howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      artemis = howlin_puppers.pets.create(image: "https://cdn.steemitimages.com/DQmUbxeLd9sLL3gCL8L8vtucbEdmEG5CCDQqTNLa2hZbsrW/IMG_20180611_200246_283.jpg",
        name: 'Artemis',
        approximate_age: 3,
        description: "People say I'm a dream",
        sex: 'Female')

      application = Application.create!(name: "John Doe", address: "123 Anywhere St.", city: "Malibu", state: "Florida", zip: "50392", phone_number: "352-956-1248", description: "I hardly ever leave my house and I need company.")
      ApplicationPet.create!(application: application, pet: artemis, approved?: true)

      expect(artemis.applicant_name(artemis.id)).to eq("John Doe")
    end
  end
end
