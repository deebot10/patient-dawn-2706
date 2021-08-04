require 'rails_helper'

RSpec.describe 'Competition Show Page' do
  before(:each) do
    @competition = Competition.create!(name: 'Mens Regional', location: 'Denver', sport: 'Basketball') 

    @team_1 = @competition.teams.create!(hometown: 'Denver', nickname: 'Nuggets')
    @team_2 = @competition.teams.create!(hometown: 'Auston', nickname: 'Rockets')
    @team_3 = @competition.teams.create!(hometown: 'Detroit', nickname: 'Pistons')
    
    @player_1 = @team_1.players.create!(name: 'Facundo Compazzo', age: 30)
    @player_2 = @team_2.players.create!(name: 'Yao Ming', age: 20)
    @player_3 = @team_3.players.create!(name: 'Ben Wallace', age: 18)


    visit competition_path(@competition.id)
  end

  describe 'Story2' do
    it 'displays a competition and attributes' do
      expect(page).to have_content(@competition.name)
      expect(page).to have_content(@competition.location)
      expect(page).to have_content(@competition.sport)
    end

    it 'displays the nickname and hometown of all teams in this competition' do
      expect(page).to have_content(@team_1.nickname)
      expect(page).to have_content(@team_2.nickname)
      expect(page).to have_content(@team_3.nickname)
    end

    it 'has the average age od all players in the competition' do
      expect(page).to have_content("Average age of players: 23")
    end
  end

  describe 'Story3' do
    it 'has a form to register a new team' do
      expect(page).to have_link('Register a New Team')

      click_link('Register a New Team')

      expect(current_path).to eq("/competitions/#{@competition.id}/teams/new")

      fill_in 'Hometown', with: 'Indiana'
      fill_in 'Nickname', with: 'Pacers'
      click_on 'Submit'

      expect(current_path).to eq(competition_path(@competition.id))
     
      
      expect(page).to have_content('Pacers')

    end
  end
end