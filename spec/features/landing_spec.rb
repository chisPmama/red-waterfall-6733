# As a user,
# When I visit "/"
# And I Select "Fire Nation" from the select field
# (Note: Use the existing select field)
# And I click "Search For Members"
# Then I should be on page "/search"
# Then I should see the total number of people who live in the Fire Nation. (should be close to 100)
# And I should see a list with the detailed information for the first 25 members of the Fire Nation.

# And for each of the members I should see:
# - The name of the member (and their photo, if they have one)
# - The list of allies or "None"
# - The list of enemies or "None"
# - Any affiliations that the member has

require "rails_helper"

RSpec.describe "Landing Page" do
  before(:each) do
    visit root_path
    expect(page).to have_field(:nation)
    select 'Fire Nation', from: :nation
    click_button "Search For Members"
  end
  
  describe 'Searching for Fire Nation Members' do
    it 'can search members by affiliation and brings user to the search path' do
      expect(current_path).to eq(search_path)
    end

    it "when Fire Nation is selected, the search path should return the total number of Fire Nation people" do
      expect(page).to have_content("Total People: 97")
      save_and_open_page
    end

    xit "contains a list in full detail of the first 25 members of the Fire Nation" do

    end

    xit "for each member, returns the name, list of allies, enemies, and any affiliations" do

    end
  end
end