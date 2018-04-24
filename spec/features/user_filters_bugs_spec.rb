require "spec_helper"

feature "A user can filter bugs" do
  context "on the home page" do
    before(:each) do
      visit root_path
    end

    specify "by country" do
      select "US", from: "search_countries"
      click_on "Search"

      expect(page).to have_content("{1=>114, 2=>99, 4=>125}")
    end

    specify "by device" do
      select "iPhone 5", from: "search_device_ids"
      click_on "Search"

      expect(page).to have_content("{6=>110, 1=>30, 3=>32, 8=>30}")
    end

    specify "by both" do
      select "JP", from: "search_countries"
      select "Droid DNA", from: "search_device_ids"
      click_on "Search"

      expect(page).to have_content("{7=>21}")
    end

    specify "by two countries" do
      select "US", from: "search_countries"
      select "JP", from: "search_countries"
      click_on "Search"

      expect(page).to have_content("{1=>114, 2=>99, 4=>125, 5=>109, 7=>117, 8=>116}")
    end
  end
end
