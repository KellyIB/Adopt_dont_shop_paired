require 'rails_helper'

describe "As a visitor" do
  describe "I can edit a review from the Shelter Show Page" do
    before(:each) do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @fantastic_friends = Shelter.create(name: "Fantastic friends", address: "9872 Friendly Lane", city: "New York City", state: "NY", zip: "10001")

      @review_1 = @howlin_puppers.reviews.create(title: "Amazing Experience!",
                                                rating: 5,
                                                content: "My experience at howlin' puppers was amazing!",
                                                image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg")

      @review_2 = @howlin_puppers.reviews.create(title: "Great place!",
                                                rating: 4,
                                                content: "It would be 5 milkbones, but they didn't have complimentary coffee")

      @review_3 = @fantastic_friends.reviews.create(title: "Amazing Experience!",
                                                rating: 5,
                                                content: "My experience at howlin' puppers was amazing!",
                                                image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/SNice.svg/1200px-SNice.svg.png")

      @review_4 = @fantastic_friends.reviews.create(title: "Great place!",
                                                  rating: 4,
                                                  content: "It would be 5 milkbones, but they didn't have complimentary coffee")
    end

    it "I see a link to edit a review for that shelter" do
      visit "/shelters/#{@howlin_puppers.id}"

      click_link("Edit Review", match: :first)
      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}/reviews/#{@review_1.id}/edit")

      fill_in :title, with: "Totally Amazing Experience!"
      fill_in :rating, with: 4
      fill_in :content, with: "They even had complimentary coffee!!"
      click_button "Save Review"

      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}")
      expect(page).to have_content("Totally Amazing Experience!")
      expect(page).to have_content(4)
      expect(page).to have_content("They even had complimentary coffee!!")
    end

    it "I see a flash message when I try to submit an incomplete form" do
      visit "/shelters/#{@howlin_puppers.id}"

      click_link("Edit Review", match: :first)
      expect(current_path).to eq("/shelters/#{@howlin_puppers.id}/reviews/#{@review_1.id}/edit")

      fill_in :title, with: "Totally Amazing Experience!"
      fill_in :rating, with: ""
      fill_in :content, with: "They even had complimentary coffee!!"
      click_button "Save Review"

      expect(page).to have_content("Rating can't be blank")
    end
  end
end
