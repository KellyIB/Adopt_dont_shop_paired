require 'rails_helper'

describe "As a visitor" do
  describe "I can delete a review from the Shelter Show Page" do
    before(:each) do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")

      @review_1 = @howlin_puppers.reviews.create(title: "Amazing Experience!",
                                                rating: "5 Milkbones",
                                                content: "My experience at howlin' puppers was amazing!",
                                                image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg")

      @review_2 = @howlin_puppers.reviews.create(title: "Great place!",
                                                rating: "4 Milkbones",
                                                content: "It would be 5 milkbones, but they didn't have complimentary coffee")

      @review_3 = @fantastic_friends.reviews.create(title: "Amazing Experience!",
                                                rating: "5 Milkbones",
                                                content: "My experience at howlin' puppers was amazing!",
                                                image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/SNice.svg/1200px-SNice.svg.png")

      @review_4 = @fantastic_friends.reviews.create(title: "Great place!",
                                                  rating: "4 Milkbones",
                                                  content: "It would be 5 milkbones, but they didn't have complimentary coffee")
    end

    it "I see a link to delete a review for that shelter" do
      visit "/shelters/#{@howlin_puppers.id}"
      click_link("Delete Review", match: :first)
      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}")
      expect(page).to_not have_content("Amazing Experience!")
      expect(page).to_not have_content("5 Milkbones")
    end
  end
end
