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
    json_response = File.read('spec/fixtures/fire_nation_results.json')
    stub_request(:get, "https://last-airbender-api.fly.dev/api/v1/characters?affiliation=fire%20nation&perPage=100").
                with(
                  headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'User-Agent'=>'Faraday v2.7.12'
                  }).
                to_return(status: 200, body: json_response, headers: {})

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
    end

    it "contains a list in full detail of the first 25 members of the Fire Nation" do
      expect(page).to_not have_content("26")
    end

    it "for each member, returns the name, list of allies, enemies, and any affiliations" do
      expect(page).to have_content("Azula")
      expect(page).to have_content("Allies: Ozai, Zuko")
      expect(page).to have_content("Enemies: Iroh, Zuko, Kuei, Long Feng, Mai, Ty Lee, Ursa")
      expect(page).to have_content("Affiliation: Azula's team (formerly) Dai Li (formerly) Fire Nation Fire Nation Royal Family Fire Warriors Royal Fire Academy for Girls (formerly)")

      expect(page).to have_content("Affiliation", count: 25)
      expect(page).to have_content("Enemies", count: 25)
      expect(page).to have_content("Allies", count: 25)
      expect(page).to have_content("Affiliation", count: 25)
      save_and_open_page
    end

    it "for members with no enemies or allies, return none" do
      within("#member-5cf5679a915ecad153ab691c") do 
        expect(page).to have_content("Enemies: None")
      end 

      within("#member-5cf5679a915ecad153ab691d") do 
        expect(page).to have_content("Allies: None")
        expect(page).to have_content("Enemies: None")
      end 
    end
  end
end