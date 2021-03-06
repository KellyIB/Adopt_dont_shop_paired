require 'rails_helper'

describe "As a visitor" do
  describe "Appproving an application" do
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

      @application_1 = Application.create!(name: "John Doe", address: "123 Anywhere St.", city: "Malibu", state: "Florida", zip: "50392", phone_number: "352-956-1248", description: "I hardly ever leave my house and I need company.")
      @application_2 = Application.create!(name: "Tin Lee", address: "926 Long Rd.", city: "Austin", state: "Texas", zip: "60636", phone_number: "345-954-1212", description: "Dogs amuse me and I'm bored often. I need entertainment.")

      ApplicationPet.create!(application: @application_1, pet: @cody)
      ApplicationPet.create!(application: @application_1, pet: @tycho)
      ApplicationPet.create!(application: @application_2, pet: @cody)
      ApplicationPet.create!(application: @application_2, pet: @artemis)
    end

    it "I see an approve application link for every pet applied for, I may approve the application for multiple pets" do
      visit "/applications/#{@application_1.id}"

      within "#application-pet-#{@cody.id}" do
        click_link "Approve Application"
      end

      expect(current_path).to eq("/pets/#{@cody.id}")
      expect(page).to have_content("Adoption Status: Pending")
      expect(page).to have_content("On Hold For: #{@application_1.name}")

      visit "/applications/#{@application_1.id}"

      within "#application-pet-#{@tycho.id}" do
        click_link "Approve Application"
      end

      expect(current_path).to eq("/pets/#{@tycho.id}")
      expect(page).to have_content("Adoption Status: Pending")
      click_link "#{@application_1.name}"
      expect(current_path).to eq("/applications/#{@application_1.id}")
    end

    it "cannot approve an application for a pet who already has an approved application" do
      visit "/applications/#{@application_1.id}"

      within "#application-pet-#{@cody.id}" do
        click_link "Approve Application"
      end

      visit "/applications/#{@application_2.id}"

      within "#application-pet-#{@cody.id}" do
        expect(page).to have_content("Revoke Application")
        expect(page).not_to have_link("Approve Application")
      end
    end

    it "After approved, an application may be revoked" do
      visit "/applications/#{@application_1.id}"

      within "#application-pet-#{@cody.id}" do
        click_link "Approve Application"
      end

      visit "/applications/#{@application_1.id}"

      within "#application-pet-#{@cody.id}" do
        click_link "Revoke Application"
      end

      expect(current_path).to eq("/applications/#{@application_1.id}")

      within "#application-pet-#{@cody.id}" do
        expect(page).to have_link("Approve Application")
      end

      visit "/pets/#{@cody.id}"
      expect(page).to have_content("Adoption Status: Adoptable")
      expect(page).not_to have_content("On Hold For: #{@application_1.name}.")
    end

    it "I see a list of all approved pet applications and every pet name listed is a link to their show page" do
      visit "/applications/#{@application_1.id}"

      within "#application-pet-#{@cody.id}" do
        click_link "Approve Application"
      end

      visit "/applications/#{@application_1.id}"

      within "#application-pet-#{@tycho.id}" do
        click_link "Approve Application"
      end

      visit "/favorites"
      expect(page).to have_content("Approved Applications")

      within "#approved-applications" do
        expect(page).to have_content("#{@cody.name}")
        expect(page).to have_content("#{@tycho.name}")
        click_link "#{@cody.name}"
      end
      expect(current_path).to eq("/pets/#{@cody.id}")

      visit "/favorites"
      within "#approved-applications" do
        expect(page).to have_content("#{@cody.name}")
        expect(page).to have_content("#{@tycho.name}")
        click_link "#{@tycho.name}"
      end
      expect(current_path).to eq("/pets/#{@tycho.id}")
    end
  end
end
