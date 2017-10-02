class TeamsController < ApplicationController

  def new
    @team = Team.new
    @league = League.find_by_id(params[:league_id])
  end

  def create
    @team = Team.new(team_params)
    @team.league = League.find_by_id(params[:league_id])
    @team.user = current_user
    if @team.save
      redirect_to @team.league
    else
      flash[:error] = @team.errors.full_messages.join(". ")
      redirect_to new_league_team_path
    end
  end

  def show
    @team = Team.find_by_id(params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name)
  end
end
