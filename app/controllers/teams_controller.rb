class TeamsController < ApplicationController
  def new;end

  def create
    competition = Competition.find(params[:id])
    team = Team.new(team_params)
    if team.save
      redirect_to competition_path(competition.id)  
    end
  end

  private
  def team_params
    params.permit(:hometown, :nickname)
  end
end