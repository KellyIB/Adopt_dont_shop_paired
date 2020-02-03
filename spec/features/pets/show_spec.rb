require 'rails_helper'

describe "As a visitor" do
  describe "When I visit a pets show page" do
    before(:each) do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")

      @artemis = @howlin_puppers.pets.create!(image: "https://cdn.steemitimages.com/DQmUbxeLd9sLL3gCL8L8vtucbEdmEG5CCDQqTNLa2hZbsrW/IMG_20180611_200246_283.jpg",
        name: 'Artemis',
        approximate_age: 3,
        description: "People say I'm a dream",
        sex: 'Female',
        adoptable?: false)

      @tycho = @fantastic_friends.pets.create!(image: "https://www.rover.com/blog/wp-content/uploads/2019/05/pupper-featured.png",
        name: 'Tycho',
        approximate_age: 3,
        description: "I'm a troublemaker",
        sex: 'Male',
        adoptable?: true)
    end

    it "I see all of that pets information including their adoption status and description" do
      visit "/pets/#{@artemis.id}"
      expect(page).to have_css("img[src*='#{@artemis.image}']")
      expect(page).to have_content("#{@artemis.name}")
      expect(page).to have_content("Aproximate Age: #{@artemis.approximate_age}")
      expect(page).to have_content("Sex: #{@artemis.sex}")
      expect(page).to have_content("Description: #{@artemis.description}")
      expect(page).to have_content("Adoption Status: Pending")

      visit "/pets/#{@tycho.id}"
      expect(page).to have_css("img[src*='#{@tycho.image}']")
      expect(page).to have_content("#{@tycho.name}")
      expect(page).to have_content("Aproximate Age: #{@tycho.approximate_age}")
      expect(page).to have_content("Sex: #{@tycho.sex}")
      expect(page).to have_content("Description: #{@tycho.description}")
      expect(page).to have_content("Adoption Status: Adoptable")

    end
  end
end
