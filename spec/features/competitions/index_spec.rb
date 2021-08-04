require 'rails_helper'

RSpec.describe 'Competition Index' do
  before(:each) do
    @competition_1 = Competition.create!(name: 'Mens Regional', location: 'Denver', sport: 'Basketball')  
    @competition_2 = Competition.create!(name: 'Womans Regional', location: 'Houston', sport: 'Baseball')  
    @competition_3 = Competition.create!(name: 'Nationals', location: 'Chicago', sport: 'Water Polo')  

    visit competitions_path
  end

  describe 'Story1' do
    it 'displays the names of all competitions' do

      expect(page).to have_content(@competition_1.name)
      expect(page).to have_content(@competition_2.name)
      expect(page).to have_content(@competition_3.name)
    end

    it 'has links to competion show page' do

      expect(page).to have_link(@competition_1.name)
      expect(page).to have_link(@competition_2.name)
      expect(page).to have_link(@competition_3.name)
    end
  end
end