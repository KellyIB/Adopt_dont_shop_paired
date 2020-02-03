require 'rails_helper'

describe "Pet edit page" do
  describe "As a visitor when I navigate to a pets show page" do
    before(:each) do
      @howlin_puppers = Shelter.create(name: "Howlin' Puppers", address: "7943 Puppers Drive", city: "Colorado Springs", state: "CO", zip: "80207")
      @rue = @howlin_puppers.pets.create(image: "https://steemitimages.com/DQmZyHkjuh4NLQLMAzTXVyz7CPTmtarfXm673bXQphJqoii/22-24_tn.jpg",
        name: 'Rue',
        approximate_age: 1,
        description: "I'm a gargoyle sometimes",
        sex: 'Female')

        @brian = @howlin_puppers.pets.create(image: "https://i.pinimg.com/originals/8f/a9/11/8fa91183ac378ec914a1f1f83a0df941.jpg",
          name: 'Brian',
          approximate_age: 12,
          description: "Crabs are people. Legit or quit!",
          sex: 'Male')
    end

    it "I see an 'Edit Pet' button and when I click it I am taken to a form to edit the pet" do
      visit "/pets/#{@rue.id}"
      click_link "Edit #{@rue.name}"

      expect(current_path).to eq("/pets/#{@rue.id}/edit")

      fill_in :name, with: 'Rwo Chains'
      click_button "Save"

      expect(current_path).to eq("/pets/#{@rue.id}")
      expect(page).to have_content("Rwo Chains")
      expect(page).to have_css("img[src*='#{@rue.image}']")
      expect(page).to have_content(@rue.approximate_age)
      expect(page).to have_content(@rue.sex)
      expect(page).to have_content(@rue.description)
    end

    it "Pets index page shows edit pet under each pet listed" do
      visit "/pets"

      within "#pet-#{@brian.id}" do
        click_link "Edit #{@brian.name}"
      end

      expect(current_path).to eq("/pets/#{@brian.id}/edit")

      fill_in :description, with: "I'm a gargoyle. Period."
      click_button "Save"

      expect(current_path).to eq("/pets/#{@brian.id}")
      expect(page).to have_content(@brian.name)
      expect(page).to have_content("I'm a gargoyle. Period.")
      expect(page).to have_css("img[src*='#{@brian.image}']")
      expect(page).to have_content(@brian.approximate_age)
      expect(page).to have_content(@brian.sex)
    end
  end
end
