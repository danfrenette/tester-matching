require "spec_helper"

feature "A user can filter bugs" do
  specify "by country" do
    visit root_path

    select "US", from: "search_countries"
    click_on "Search"
    
    expect(page).to have_content("{1=>114, 2=>99, 4=>125}")
  end
end
