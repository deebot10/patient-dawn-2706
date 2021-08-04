class TeamsController < ApplicationController

  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    competition = Competition.find(params[:competition_id])
    team = competition.teams.create!(team_params)
    redirect_to competition_path(competition.id)  
  end

  private
  def team_params
    params.require(:team).permit(:hometown, :nickname)
  end
end