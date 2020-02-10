 require 'rails_helper'

 describe 'As a visitor when I visit the shelter index page I see a link to add
          a new shelter. When I click the link I am taken /shelters/new' do

  it "shows fields to fill in the shelter name, address, city, state and zip." do
    visit '/shelters'
    click_link "Add New Shelter"

    # fill in form information
    expect(current_path).to eq('/shelters/new')
    fill_in :name, with: "Barkin' Doggos"
    fill_in :address, with: "5112 Barkin Plaza"
    fill_in :city, with: "Hollywood"
    fill_in :state, with: "CA"
    fill_in :zip, with: "20938"
    click_on "Create New Shelter"

    # Expect to be redirected to /shelters
    expect(current_path).to eq('/shelters')

    # Expect flash message for successful shelter creation
    shelter = Shelter.last
    expect(page).to have_content("#{shelter.name} Was Created")

    # Checking that the shelter created above was actually created
    new_shelter = Shelter.last
    within "#shelter-#{new_shelter.id}" do
      expect(page).to have_content(new_shelter.name)
      click_link("#{new_shelter.name}")
    end

    # Routing to show page to verify shelter creation
    expect(current_path).to eq("/shelters/#{new_shelter.id}")
    expect(page).to have_content("Barkin' Doggos")
    expect(page).to have_content("5112 Barkin Plaza")
    expect(page).to have_content("Hollywood")
    expect(page).to have_content("CA")
    expect(page).to have_content("20938")
  end

  it "when I fail to fill out all fields I see a flash message and the new view is rendered" do
    visit '/shelters'
    click_link "Add New Shelter"

    expect(current_path).to eq('/shelters/new')
    fill_in :name, with: "Barkin' Doggos"
    fill_in :address, with: "5112 Barkin Plaza"
    fill_in :city, with: ""
    fill_in :state, with: "CA"
    fill_in :zip, with: "20938"
    click_on "Create New Shelter"


    expect(current_path).to eq('/shelters/new')
    expect(page).to have_content("City can't be blank")
  end
end
