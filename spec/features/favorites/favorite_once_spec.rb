require 'rails_helper'

describe "As a visitor" do
  describe "When I favorite a pet" do
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

    end

    it "I can favorite a pet only once" do
      visit "/pets/#{@artemis.id}"
      click_link("Add #{@artemis.name} to Favorites")
      expect(page).to have_no_link("Add #{@artemis.name} to Favorites")
      expect(page).to have_link("Remove #{@artemis.name} From Favorites")

      visit "/pets/#{@tycho.id}"
      click_link("Add #{@tycho.name} to Favorites")
      expect(page).to have_no_link("Add #{@tycho.name} to Favorites")
      expect(page).to have_link("Remove #{@tycho.name} From Favorites")
    end

  end
end
