require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  before(:each) do
    @competition = Competition.create!(name: 'Mens Regional', location: 'Denver', sport: 'Basketball') 

    visit competition_path(@competition.id)
  end

  describe 'Story2' do
    #     User Story 2 - Competition Show Page

    # As a user
    # When I visit a competition's show page
    # Then I see the competition's name, location, and sport
    # And I see the nickname and hometown of all teams in this competition
    # And I see the average age of all players in the competition
    it 'displays a competition and attributes' do
      expect(page).to have_content(@competition.name)
      expect(page).to have_content(@competition.location)
      expect(page).to have_content(@competition.sport)
    end
  end
end