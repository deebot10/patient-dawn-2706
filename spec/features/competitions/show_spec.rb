require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  before(:each) do
    @competition = Competition.create!(name: 'Mens Regional', location: 'Denver', sport: 'Basketball') 

    visit competition_path(@competition.id)
  end

  describe 'Story2' do
    it 'displays a competition and attributes' do
      expect(page).to have_content(@competition.name)
      expect(page).to have_content(@competition.location)
      expect(page).to have_content(@competition.sport)
    end
  end
end