require "spec_helper"

feature "A user can filter bugs" do
  context "on the home page" do
    before(:each) do
      Rails.application.load_seed
      visit root_path
    end

    specify "by country" do
      select "US", from: "search_countries"
      click_on "Search"

      results = "Taybin Rutkin 125 Miguel Bautista 114 Michael Lubavin 99
      Darshini Thiagarajan 0 Stanley Chen 0 Lucas Lowry 0 Leonard Sutton 0 Sean
      Wellington 0 Mingquan Zheng 0"
      expect(page).to have_content(results)
    end

    specify "by device" do
      select "iPhone 5", from: "search_device_ids"
      click_on "Search"

      results = "Stanley Chen 110 Leonard Sutton 32 Sean Wellington 30 Miguel
      Bautista 30 Darshini Thiagarajan 0 Michael Lubavin 0 Taybin Rutkin 0
      Mingquan Zheng 0 Lucas Lowry 0"
      expect(page).to have_content(results)
    end

    specify "by both" do
      select "JP", from: "search_countries"
      select "Droid DNA", from: "search_device_ids"
      click_on "Search"

      results = "Lucas Lowry 21 Taybin Rutkin 0 Sean Wellington 0 Mingquan Zheng
      0 Michael Lubavin 0 Darshini Thiagarajan 0 Miguel Bautista 0 Stanley Chen
      0 Leonard Sutton 0"

      expect(page).to have_content(results)
    end

    specify "by two countries" do
      select "US", from: "search_countries"
      select "JP", from: "search_countries"
      click_on "Search"

      results = "Taybin Rutkin 125 Lucas Lowry 117 Sean Wellington 116 Miguel
      Bautista 114 Mingquan Zheng 109 Michael Lubavin 99 Darshini Thiagarajan 0
      Stanley Chen 0 Leonard Sutton 0"
      expect(page).to have_content(results)
    end
  end
end
