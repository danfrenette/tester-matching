require "spec_helper"

feature "A user can filter bugs" do
  specify "by country" do
    visit root_path

    select "US", from: "search_countries"
    click_on "Search"
    #expect statement
  end
end
