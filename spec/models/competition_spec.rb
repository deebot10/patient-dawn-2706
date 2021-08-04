require 'rails_helper'

RSpec.describe Competition do

  describe 'relationships' do
    it {should have_many :team_competitions}
    it {should have_many(:teams).through(:team_competitions)}
    it {should have_many(:players).through(:teams)}
  end

  before(:each) do
    @competition = Competition.create!(name: 'Mens Regional', location: 'Denver', sport: 'Basketball') 

    @team_1 = @competition.teams.create!(hometown: 'Denver', nickname: 'Nuggets')
    @team_2 = @competition.teams.create!(hometown: 'Auston', nickname: 'Rockets')
    @team_3 = @competition.teams.create!(hometown: 'Detroit', nickname: 'Pistons')
    
    @player_1 = @team_1.players.create!(name: 'Facundo Compazzo', age: 30)
    @player_2 = @team_2.players.create!(name: 'Yao Ming', age: 20)
    @player_3 = @team_3.players.create!(name: 'Ben Wallace', age: 18)  
  end

  describe 'instance methods' do
    it '::average_age' do
      expect(@competition.average_age.round).to eq(23)
    end
  end
end