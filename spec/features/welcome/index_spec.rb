require 'rails_helper'

describe "As a visitor" do
  describe "Welcome Index Page" do
    it "Shows the website mission statement and links to the rest of the site" do
      mission_statement = "Our sites mission is to list shelters that nurture, and support rescued animals until they find their permanent homes"

      visit '/'
      expect(page).to have_content(mission_statement)
    end
  end
end
